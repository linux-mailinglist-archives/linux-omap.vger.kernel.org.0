Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56908790750
	for <lists+linux-omap@lfdr.de>; Sat,  2 Sep 2023 12:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243943AbjIBK0r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Sep 2023 06:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234809AbjIBK0r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Sep 2023 06:26:47 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72CB10FA
        for <linux-omap@vger.kernel.org>; Sat,  2 Sep 2023 03:26:43 -0700 (PDT)
Received: from p5dc58aa5.dip0.t-ipconnect.de ([93.197.138.165] helo=aktux)
        by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1qcNpt-003H9M-EY; Sat, 02 Sep 2023 12:26:37 +0200
Date:   Sat, 2 Sep 2023 12:26:35 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Patrik =?UTF-8?B?RGFobHN0csO2bQ==?= <risca@dalakolonin.se>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org
Subject: Re: ABE/AESS on modern kernel: clocks, hwmods etc.
Message-ID: <20230902122635.2482b0cf@aktux>
In-Reply-To: <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
References: <53bc74ae-a2d5-40d5-8d51-bc0f062fcd15@email.android.com>
        <45F44D32-E846-4A53-BA20-9C78CD4411F3@goldelico.com>
        <ZO4SWw/rbJH5Dpbq@dalakolonin.se>
        <A029FB33-9FBB-4CE5-92D5-597E10B3A032@goldelico.com>
        <ZPH5Yr3w7ruN/io0@dalakolonin.se>
        <05B47ED4-CA2C-4754-ABB1-0591E9018E57@goldelico.com>
        <ZPLYG16mwiwt9G9R@dalakolonin.se>
        <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 2 Sep 2023 09:27:41 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi Tony,
> we are still struggling with ABE/AESS on the OMAP4/5 (PandaES, Pyra, OMAP5UEVM, BT-200).
> 
> Symptoms are that
> * pmem access will be broken after initializing the ABE-DSP
> * it seems the AES DSP is not running (and leads to timeouts when sending audio data to the buffers)
> * boot issues on BT-200
> 
> What we have found is that a TI kernel v3.8 works on the OMAP5EVM but newer kernels start to fail.
> 
> A major observation ist that hwmods have been removed in smaller pieces and the last removal
> was in v5.6: c33ff4c864d2b ARM: OMAP2+: Drop unused PRM defines for omap4
> 
> There are also some other unknown factors in our code where we do not know how to port to modern
> kernels:
> * there is a context lost code but how to make use of it?
> * pmem fails unless we disable omap_aess_write_event_generator(aess, EVENT_TIMER);
> 
> It seems as if clocks and code like omap_hwmod_aess_preprogram() is missing. Especially for the
> omap4 we have found no equivalent to aess_fclk which exists for omap5 and dra7.
> Nowhere is a reference using the abe_iclk node.
> 
for omap4 I guess the 
                        clocks = <&abe_clkctrl OMAP4_AESS_CLKCTRL 0>;

in omap4-l4-abe.dtsi should be enough and correcly referencing fclk?

Regards,
Andreas
