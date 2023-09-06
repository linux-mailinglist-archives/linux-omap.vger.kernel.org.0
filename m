Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32CB9793E0D
	for <lists+linux-omap@lfdr.de>; Wed,  6 Sep 2023 15:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240950AbjIFNul (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Sep 2023 09:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235672AbjIFNuh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Sep 2023 09:50:37 -0400
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B16CE6B
        for <linux-omap@vger.kernel.org>; Wed,  6 Sep 2023 06:50:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 271E23F3FA;
        Wed,  6 Sep 2023 15:50:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -2.097
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Authentication-Results: ste-pvt-msa2.bahnhof.se (amavisd-new);
        dkim=pass (2048-bit key) header.d=dalakolonin.se
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id A0nvHfmS3LYc; Wed,  6 Sep 2023 15:50:24 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5E6A83F365;
        Wed,  6 Sep 2023 15:50:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.dalakolonin.se (Postfix) with ESMTP id 23BFA10025E;
        Wed,  6 Sep 2023 13:50:22 +0000 (UTC)
Received: from zimbra.dalakolonin.se ([127.0.0.1])
        by localhost (zimbra.dalakolonin.se [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Fa33U2Tcv5Sy; Wed,  6 Sep 2023 13:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.dalakolonin.se (Postfix) with ESMTP id 43A46100257;
        Wed,  6 Sep 2023 13:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.dalakolonin.se 43A46100257
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dalakolonin.se;
        s=D374B428-D0A7-11ED-A657-75977B426508; t=1694008220;
        bh=xZPj9Gc3lA3TieI8bCNwIyx2JOCIWOf4a31gaZEqUHs=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=oB5KpITKJvyAqIhh+tpXFXaT/pzOKwzgYliUN3fjJcQ6dwXXmJ+Osb3pXWYLM4VEB
         wWEQTuBwDJIIavEmdosKd/kz0KvyinwMkBke5nFR0lyyqF5dF9C6zAPNLEThjftCR4
         leSE6SF/P7VU8b/Etl8Ld2xrlObpN+/J1r5MxPGHcrkVXCSOw5J25DR3ceonsFKlPI
         qBE9l8O8r6077sTZbOAYStWb0meVo/i2/Y+iUVnb4+RfXC9paQWcz/DnBix/vBNEwH
         Jq6cd2Cs5RV3T8nABvPLdsDPiF5DSe/vfBnHC1J7lcfZUBei9IysgB3E3W3BX9rhJu
         PCmfi8K08kONA==
X-Virus-Scanned: amavisd-new at dalakolonin.se
Received: from zimbra.dalakolonin.se ([127.0.0.1])
        by localhost (zimbra.dalakolonin.se [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id VAh5nVbfNQ3c; Wed,  6 Sep 2023 13:50:19 +0000 (UTC)
Received: from dalakolonin.se (unknown [172.17.0.1])
        by zimbra.dalakolonin.se (Postfix) with ESMTPSA id C2167100250;
        Wed,  6 Sep 2023 13:50:19 +0000 (UTC)
Date:   Wed, 6 Sep 2023 15:50:18 +0200
From:   Patrik =?iso-8859-1?Q?Dahlstr=F6m?= <risca@dalakolonin.se>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: ABE/AESS on modern kernel: clocks, hwmods etc.
Message-ID: <ZPiDms7VWcGKt489@dalakolonin.se>
References: <A029FB33-9FBB-4CE5-92D5-597E10B3A032@goldelico.com>
 <ZPH5Yr3w7ruN/io0@dalakolonin.se>
 <05B47ED4-CA2C-4754-ABB1-0591E9018E57@goldelico.com>
 <ZPLYG16mwiwt9G9R@dalakolonin.se>
 <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
 <20230902122635.2482b0cf@aktux>
 <20230904063432.GV11676@atomide.com>
 <03375B42-C86E-4B37-98C2-C1FBA7AB68B6@goldelico.com>
 <20230905061208.GW11676@atomide.com>
 <9CF135C5-85B6-47CC-985C-FE6F4B24407D@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9CF135C5-85B6-47CC-985C-FE6F4B24407D@goldelico.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 05, 2023 at 02:42:03PM +0200, H. Nikolaus Schaller wrote:
> 
> Finally all this was based on some 3.15 DTS entry by TI which has a single ti,hwmods = "aess"; entry.
> 
> I have not found a link to the original but have a copy in our tree:
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=commit;h=ca9ee9532104eac5cfee1bd77a2bf6296cbec648

I've been working with the Linux-3.8.13 from GLSDK 6_03_00_01. The kernel
sources in that SDK point to omapzoom.org, which is quite slow. I also
found the same commit here:
https://git.ti.com/cgit/android-sdk/kernel-omap/commit/?h=p-ti-glsdk-3.8.y&id=cc16f99176bf083829c028f9af5b8eb560debcc1
