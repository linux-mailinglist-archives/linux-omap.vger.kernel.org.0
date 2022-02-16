Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6DB34B8704
	for <lists+linux-omap@lfdr.de>; Wed, 16 Feb 2022 12:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbiBPLrJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Feb 2022 06:47:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiBPLrJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Feb 2022 06:47:09 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4986346171
        for <linux-omap@vger.kernel.org>; Wed, 16 Feb 2022 03:46:57 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B10BD80EB;
        Wed, 16 Feb 2022 11:46:14 +0000 (UTC)
Date:   Wed, 16 Feb 2022 13:46:54 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: AM5749: tty serial 8250 omap driver crash
Message-ID: <YgzkLjWwIlm9/SiK@atomide.com>
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
 <YgDSj7FJS7nbkJol@atomide.com>
 <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
 <YgT/fhpFQfkj1b0j@atomide.com>
 <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com>
 <YgpUNMAiXgu+vrtl@atomide.com>
 <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Romain Naour <romain.naour@smile.fr> [220216 09:04]:
> Hello,
> 
> Le 14/02/2022 à 14:08, Tony Lindgren a écrit :
> > * Tony Lindgren <tony@atomide.com> [220214 07:43]:
> >> Looks like the following script to just toggle the module state locks
> >> up things for me on beagle-x15 very fast. So yeah now I'm able to
> >> reproduce the issue. Seems like the module is not ready right after
> >> enabling it live we've seen for dra7 iva for example.
> > 
> > Looks like the following patch is also needed for uarts to avoid unbind
> > clock_unprepare warnings. But even with this patch dra7 uarts won't behave.
> > On unbind, there will be a clock "l4per-clkctrl:0128:0: failed to disable"
> > warning. Looks like after that any following clock enable does not seem to
> > work and that will cause the register access errors.
> > 
> > Looks like this is a dra7 specific issue as a similar test script on omap4
> > duovero keeps on going instead.
> 
> Thanks for the help and the patch!
> 
> I removed my patch removing the quirk and applied you patch but I can still
> reproduce the issue.

Yeah issues still exists for sure, looks like also omap4 fails but it just
takes a while to produce the clkctrl disable error. And remove for 8250_omap
is incomplete..

Below is a patch that makes the rebind of kernel serial console behave for me
together with the ti-sysc patch.

Additionally I also need to disable dma for now with:

&uart3 {
	/delete-property/ dma-names;
};

> Do you need some info about the kernel configuration?

Not really but if you can please test again with the ti-sysc patch,
8250_omap patch and with your serdev uart dma disabled with
delete-property?

Regards,

Tony

8< -----------------
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1475,10 +1475,15 @@ static int omap8250_probe(struct platform_device *pdev)
 static int omap8250_remove(struct platform_device *pdev)
 {
 	struct omap8250_priv *priv = platform_get_drvdata(pdev);
+	struct uart_8250_port *up = serial8250_get_port(priv->line);
 
+	pm_runtime_resume_and_get(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	dev_pm_clear_wake_irq(&pdev->dev);
+	cancel_work_sync(&priv->qos_work);
+	cancel_delayed_work(&up->overrun_backoff);
 	serial8250_unregister_port(priv->line);
 	cpu_latency_qos_remove_request(&priv->pm_qos_request);
 	device_init_wakeup(&pdev->dev, false);
