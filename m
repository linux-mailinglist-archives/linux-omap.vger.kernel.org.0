Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE8E380D6D
	for <lists+linux-omap@lfdr.de>; Fri, 14 May 2021 17:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbhENPje (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 May 2021 11:39:34 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58884 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234934AbhENPjd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 May 2021 11:39:33 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14EFcBdW116931;
        Fri, 14 May 2021 10:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621006691;
        bh=E/alwcgV9JJknmFSls3odmi4/ieZzTJaOoriooxhqbE=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=g9vJWTB8Oy1iuROhwCvLR+qkv4A2wMv6PcDpUYPpcfOna50HdPXZm0rYztJqyw3c8
         WI3Mgw6Sp5w78EjOtB4NV6hU4d7QP1GAfTdfriOmfEwGMPVOjBc9ouL2x2rBvPU4mW
         d7TeyTvjURV3eJDvWlaqOwphzyH+z2mARkoL2QW0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14EFcBvl098869
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 May 2021 10:38:11 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 14
 May 2021 10:38:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 14 May 2021 10:38:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14EFcAEc119567;
        Fri, 14 May 2021 10:38:10 -0500
Date:   Fri, 14 May 2021 10:38:10 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        <linux-omap@vger.kernel.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
Subject: Re: Status of ti/ti-linux-5.10.y development
Message-ID: <20210514153810.qv2kjdoy2ku2ss5d@unlearned>
References: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
 <56825232-0920-f2c6-b4c7-cb488465d870@ti.com>
 <9cb5a7d4-bf01-7079-8556-f6de008872c9@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9cb5a7d4-bf01-7079-8556-f6de008872c9@lucaceresoli.net>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Luca,
On 12:20-20210514, Luca Ceresoli wrote:
> Hi Grygorii,
> 
> On 14/05/21 12:14, Grygorii Strashko wrote:
> > Hi
> > 
> > On 14/05/2021 11:30, Luca Ceresoli wrote:
> >> Hi,
> >>
> >> I hope this is the proper place for this question. If it isn't: my
> >> apologies, and I'd be glad to be redirected where appropriate.
> >>
> >> I currently have a prototype board based on AM5728 that is mostly
> >> working, using branch ti/ti-linux-4.19.y of the TI kernel [0].
> >>
> >> Now I need some non-TI-specific kernel features that appeared in
> >> mainline 5.10, so I tried to move to branch ti/ti-linux-5.10.y. But many
> >> components that I am using on the 4.19 branch seem absent on the 5.10
> >> branch, including VIDEO_TI_VIP, DRM_OMAP_WB and DRM_OMAP_CONNECTOR_HDMI.
> >>
> >> BTW they are not present even in mainline Linux.
> >>
> >> Are this drivers still absent and in progress of being added to
> >> ti/ti-linux-5.10.y, or are they present in a different form that I have
> >> been unable to find?
> >>
> >> Assuming they still have to be added, is there an estimate timing for
> >> their availability on the 5.10 branch?
> >>
> >> [0] git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
> >>
> > 
> > 
> > TI 5.10 migration is still work in progress.
> 
> Thanks for the feedback.
> 
> Any estimate of how long this is expected to take?

Nothing we will be able to share in a public forum :(

> 
> Is there any public list of drivers to be added and their status?

In public, No - Note: even though the git repo is public, and
internally we attempt to follow the same upstream rules, at the end,
it is still a vendor kernel :(. But, rest assure that internally, we
know precisely where we are and we are tracking towards completion.

While linux-omap is a public list, it might be better to answer
vendor kernel questions in the context of e2e.ti.com (The TI forums
- there are folks closely monitoring those and actively engaging
to help customers out and will be better positioned to answer your
specific queries). Do feel free to reach out to me on irc freenode.net
#linux-omap etc if you'd need anything specific to help with.

We usually prefer linux-omap mailing list to stick with upstream
discussions, one off vendor kernel discussions do take place from time
to time, however, most of our TI support folks are better equipped to
answer questions on TI forums.


The above "officialdom statement" said, we do actively encourage our
community (which we include ourselves and TI customers as well) to
participate in making upstream kernel complete and point out anything
we may have overlooked (yep, we are human) so that overall what vendor
kernel does or does'nt do should be inconsequential in the longer term
for the community and products derived from community.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
