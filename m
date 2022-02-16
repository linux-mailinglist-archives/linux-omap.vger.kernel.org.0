Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749CF4B8737
	for <lists+linux-omap@lfdr.de>; Wed, 16 Feb 2022 12:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbiBPL5I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Feb 2022 06:57:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbiBPL5H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Feb 2022 06:57:07 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 12E555F74
        for <linux-omap@vger.kernel.org>; Wed, 16 Feb 2022 03:56:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5B4A580EB;
        Wed, 16 Feb 2022 11:56:07 +0000 (UTC)
Date:   Wed, 16 Feb 2022 13:56:46 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     qianfan <qianfanguijin@163.com>
Cc:     linux-omap@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>
Subject: Re: OMAP GPIO ready too later
Message-ID: <Ygzmfh+F3J8Zt9vl@atomide.com>
References: <63abe475-710f-9ff5-ef20-c78b2a3d5e5c@163.com>
 <YfubSOB+uq9jYf/N@atomide.com>
 <bb16001d-4a1b-f842-9445-7305e3496997@163.com>
 <YgoJqP1xBsuqX2ui@atomide.com>
 <379b9e75-933c-902c-0f6e-807be9acebc5@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <379b9e75-933c-902c-0f6e-807be9acebc5@163.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* qianfan <qianfanguijin@163.com> [220216 04:05]:
> 在 2022/2/14 15:50, Tony Lindgren 写道:
> > Well seems like the boottime of 1.25 seconds to having the gpio probed should
> > be way longer than your bootloader configured watchdog timeout :) What do you
> > have the bootloader set the watchdog timeout?
> I had sniffer the gpio data by using logic analysis, when the linux gpio-wdt
> driver toggle watchdog pin, it passed about 5 seconds after the u-boot done.
> And the gpio watchdog's deadline is 1.6s.

Well on my beaglebone black looks like gpios are initialized around 1.7s,
but pinctrl is initialized around 0.25s. You could create some driver that
in it's init sets the related gpio pin to PIN_OUTPUT_PULLUP | SAFE_MODE
to kick the gpio watchdog, and then exits releasing the pinmux so the
gpio based driver can take over. Or maybe your gpio watchdog driver could
do pin configuration in init, then do what it currently does in probe.

Of course booting things faster would be the best solution, but that can
easily get delayed with kernel updates with deferred probe for example.

Regards,

Tony
