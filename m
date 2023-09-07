Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A47C7797021
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 07:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbjIGFfd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 01:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjIGFfc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 01:35:32 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4F7B819B4
        for <linux-omap@vger.kernel.org>; Wed,  6 Sep 2023 22:35:26 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 962CD8050;
        Thu,  7 Sep 2023 05:35:25 +0000 (UTC)
Date:   Thu, 7 Sep 2023 08:35:24 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Patrik =?utf-8?Q?Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        peter.ujfalusi@gmail.com, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: Re: [RFC 4/6] ARM: DTS: omap4-l4-abe: Add McASP configuration
Message-ID: <20230907053524.GG11676@atomide.com>
References: <cover.1693918214.git.hns@goldelico.com>
 <6a4f04d5f977344b168d34029da4402cf37d8f68.1693918214.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a4f04d5f977344b168d34029da4402cf37d8f68.1693918214.git.hns@goldelico.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [230905 15:58]:
> From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> 
> OMAP4 has a single McASP instance with single serializer and locked for DIT
> mode.
> To be able to enable the support the following fixes needed:
> - Add the DAT port ranges to the target module's ranges

I think the above has been already done?

> - SIDLE mode must be disabled as it is not working with McASP
>  most likely module integration issue with McASP

Best to keep the dts entry as is and add quirk handling to ti-sysc driver
instead based on mcasp revision register detection. The dts is meant to
describe hardware and the register values exist.. But looking at ti-sysc
we already have mcasp tagged with SYSC_QUIRK_SWSUP_SIDLE.

If this patch is still needed, maybe check the revision register value and
mask in case there are multiple revisions, that's this line in ti-sysc:

SYSC_QUIRK("mcasp", 0, 0, 0x4, -ENODEV, 0x44306302, 0xffffffff,
           SYSC_QUIRK_SWSUP_SIDLE),

Regards,

Tony
