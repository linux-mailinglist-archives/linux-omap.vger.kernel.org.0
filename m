Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 370E1792454
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjIEP6r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354824AbjIEOpT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 10:45:19 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F99197
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 07:45:12 -0700 (PDT)
Received: from pd9e2f2ad.dip0.t-ipconnect.de ([217.226.242.173] helo=aktux)
        by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1qdXIV-003OAX-Cs; Tue, 05 Sep 2023 16:44:55 +0200
Date:   Tue, 5 Sep 2023 16:44:53 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Patrik =?UTF-8?B?RGFobHN0csO2bQ==?= <risca@dalakolonin.se>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: ABE/AESS on modern kernel: clocks, hwmods etc.
Message-ID: <20230905164453.3be3f33a@aktux>
In-Reply-To: <9CF135C5-85B6-47CC-985C-FE6F4B24407D@goldelico.com>
References: <45F44D32-E846-4A53-BA20-9C78CD4411F3@goldelico.com>
        <ZO4SWw/rbJH5Dpbq@dalakolonin.se>
        <A029FB33-9FBB-4CE5-92D5-597E10B3A032@goldelico.com>
        <ZPH5Yr3w7ruN/io0@dalakolonin.se>
        <05B47ED4-CA2C-4754-ABB1-0591E9018E57@goldelico.com>
        <ZPLYG16mwiwt9G9R@dalakolonin.se>
        <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
        <20230902122635.2482b0cf@aktux>
        <20230904063432.GV11676@atomide.com>
        <03375B42-C86E-4B37-98C2-C1FBA7AB68B6@goldelico.com>
        <20230905061208.GW11676@atomide.com>
        <9CF135C5-85B6-47CC-985C-FE6F4B24407D@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 5 Sep 2023 14:42:03 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi Tony,
> 
> > Am 05.09.2023 um 08:12 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > The key observation is that the abe_iclk references in the DTS seem to be nowhere referenced  
> >> (which may or may not be an issue):
> >> 
> >> https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi#L509
> >> https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boot/dts/ti/omap/omap54xx-clocks.dtsi#L161  
> > 
> > So I guess the ick is in the dts the ocp_abe_iclk@528 for omap4 and
> > abe_iclk@528 for omap5. Seems like the driver should request them, I recall
> > that the interconnect target module does not need the ick to access sysc
> > and revision registers.  
> 
> Yes, that is what I suspect but I don't know how to request them.
> 
add ,"ick" to the clock-names line in the target-module?
and ,<&ocp_abe_iclk> to the target module?

Regards,
Andreas
