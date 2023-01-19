Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B2D674437
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jan 2023 22:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjASVW2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Jan 2023 16:22:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjASVWD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Jan 2023 16:22:03 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56AF87287
        for <linux-omap@vger.kernel.org>; Thu, 19 Jan 2023 13:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=h9N/HW/LeH8W09KSaxiKhfpHnzZswyTOjUsJzkEM4uY=; b=9C3B0VQT5jru1dChx///+AOobv
        vYt+0Lxw/cPmrEp4yhc+mr84IhW6EyIFEMjXjrC7KSohZnxLIL3wqRm1u0RUseoBKSGvGZ7IPAKpm
        0wvuk+sLKiyglHtrR6oXHFFH5om95EQe1zpEv/mKFKDYvc6zBtSc5oOV1TO/RU9//fKrmlfWONxeK
        iimy/ZKmSDetGRZ8AAt7/7POY2mIRXZLpTwTfPoEWKbIQz8S5/P36nonk8EKyKW4h+xGq342BpF7J
        4XaBe+KMhbBT9bWFBOLPyM1piNw281KgtYwVRgCKF+fZKrK/crH4xQ1SuWaK8S3Wg479cKcT58OHZ
        kyH5HvNw==;
Received: from p200300ccff0e60001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0e:6000:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1pIcGr-0002e3-36; Thu, 19 Jan 2023 22:16:29 +0100
Date:   Thu, 19 Jan 2023 22:16:28 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, peter.ujfalusi@gmail.com,
        jarkko.nikula@bitmer.com
Subject: Re: omap  mcbsp and prcm_fck
Message-ID: <20230119221628.169766c9@aktux>
In-Reply-To: <Y8j0MMLoanjo1MCf@atomide.com>
References: <20230117120810.6cf8b6f7@aktux>
        <Y8j0MMLoanjo1MCf@atomide.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Thu, 19 Jan 2023 09:41:36 +0200
Tony Lindgren <tony@atomide.com> wrote:

> Hi,
> 
> * Andreas Kemnade <andreas@kemnade.info> [230117 11:08]:
> > Hi,
> > 
> > while trying to create a devicetree for a omap4 device, I stumbled upon this:
> > 
> > [   59.789367] omap-mcbsp 40124000.mcbsp: CLKS: could not clk_get() prcm_fck
> > 
> > But where should prcm_fck come from? The string does not appear in the
> > devicetree binding documentation. I have seen it only in the omap_hwmod_* stuff
> > used by omap2/3.
> > 
> > So how to make mcbsp happy?  
> 
> I think all you need to do is add an entry for prcm_fck to point to
> mcbsp4_sync_mux_ck in omap44xx_clks[]. Seems this got dropped with commit
> 349355ce3a05 ("ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp").
> 
> Or patch the driver so it tries to use the dt clock so that the standard
> assigned-clocks devicetree property works for a board specific
> configuration.
> 
I tried this hack-fix:

--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -64,7 +64,7 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
        if (fck_src_id == MCBSP_CLKS_PAD_SRC)
                src = "pad_fck";
        else if (fck_src_id == MCBSP_CLKS_PRCM_SRC)
-               src = "prcm_fck";
+               src = "mcbsp2_sync_mux_ck";
        else
                return -EINVAL;


Then I stumple upon the next problem:
omap-mcbsp 40124000.mcbsp: CLKS: could not clk_set_parent() to mcbsp2_sync_mux_ck

Regards,
Andreas
