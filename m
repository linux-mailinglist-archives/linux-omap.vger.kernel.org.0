Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EF9380700
	for <lists+linux-omap@lfdr.de>; Fri, 14 May 2021 12:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233110AbhENKQB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 May 2021 06:16:01 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41068 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbhENKQB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 May 2021 06:16:01 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14EAEh1b072886;
        Fri, 14 May 2021 05:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620987283;
        bh=LC9ZVLG7yP+4ly5FQrtbB7xgj/s+tD1B4KO4syd3oh4=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=n20TOxyU+Obj9jtUOrebJlmfZ+Zuf0ydjTF2NWe/OOOR9PWHW5RhaW3sho1x3CeRE
         IM+qhIBzNBd+6TdvJhr05eMe4YMILyymCd0kRQjaFXwFIu/Hy6JontvcdwpsvLCRhU
         TqZQwh4FBj9aZsLzxHwC/wP/rEiFHUzQJaNN8bDY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14EAEhxV116217
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 May 2021 05:14:43 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 14
 May 2021 05:14:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 14 May 2021 05:14:43 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14EAEeSk126089;
        Fri, 14 May 2021 05:14:42 -0500
Subject: Re: Status of ti/ti-linux-5.10.y development
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        <linux-omap@vger.kernel.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Menon, Nishanth" <nm@ti.com>, "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <56825232-0920-f2c6-b4c7-cb488465d870@ti.com>
Date:   Fri, 14 May 2021 13:14:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi

On 14/05/2021 11:30, Luca Ceresoli wrote:
> Hi,
> 
> I hope this is the proper place for this question. If it isn't: my
> apologies, and I'd be glad to be redirected where appropriate.
> 
> I currently have a prototype board based on AM5728 that is mostly
> working, using branch ti/ti-linux-4.19.y of the TI kernel [0].
> 
> Now I need some non-TI-specific kernel features that appeared in
> mainline 5.10, so I tried to move to branch ti/ti-linux-5.10.y. But many
> components that I am using on the 4.19 branch seem absent on the 5.10
> branch, including VIDEO_TI_VIP, DRM_OMAP_WB and DRM_OMAP_CONNECTOR_HDMI.
> 
> BTW they are not present even in mainline Linux.
> 
> Are this drivers still absent and in progress of being added to
> ti/ti-linux-5.10.y, or are they present in a different form that I have
> been unable to find?
> 
> Assuming they still have to be added, is there an estimate timing for
> their availability on the 5.10 branch?
> 
> [0] git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
> 


TI 5.10 migration is still work in progress.

-- 
Best regards,
grygorii
