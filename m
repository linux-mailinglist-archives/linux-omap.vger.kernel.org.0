Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF362AB72F
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbgKILdy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:33:54 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56910 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729882AbgKILdv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:33:51 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9BXeD0005873;
        Mon, 9 Nov 2020 05:33:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604921620;
        bh=3BSddBlFZc+VBUU/q2H/wH8ZwgDPC1EicBCpH1QebwE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NbcCvHMtvPXdhFVGkRHtOE+wdk8U8sM3134HSNUmZ58jOa9CunzjvLK8XRYMR4Yzh
         NkecqhHmljgpqfKXmOsLnnJgdopKuidlbUUjqAGiNLw5DA/bubnVQ9KmVhroXt3jB7
         fTuWTtY4LVKws1wITsU5tTxQArTvf6Tl3pfTLdu4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9BXeIX124712
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Nov 2020 05:33:40 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 05:33:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 05:33:40 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9BXc2J081879;
        Mon, 9 Nov 2020 05:33:38 -0600
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
 <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
 <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
 <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
 <67786545-23D2-444F-85B8-7A030070B317@goldelico.com>
 <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com>
 <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com>
 <db0b9694-4d04-18ba-fdf0-093b5914bbf0@ti.com>
 <6A9407FC-69F7-4E30-B4A3-FFB2E91CAE3B@goldelico.com>
 <1cf563e5-2dc0-1802-86e3-3e24150f0651@ti.com>
 <BBC7824A-A689-4144-969C-32608A202A75@goldelico.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7f820fd2-820b-bfdd-a43b-174ad6b09868@ti.com>
Date:   Mon, 9 Nov 2020 13:33:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BBC7824A-A689-4144-969C-32608A202A75@goldelico.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/11/2020 13:09, H. Nikolaus Schaller wrote:

>>> I see.
>>> Anyways there is missing some simple thing which makes the driver not prepared/enabled.
>>> Or is this related to VC?
>>
>> No, that's not related to the VC.
> 
> Ok, then it is worth searching for that independently. Any idea/hint what could be missing?

Well, if I had to guess, I would go for either 1) some registration or such is missing from the
panel driver, or 2) some config value is invalid, which makes the DRM framework or the DSI driver
fail before calling prepare or enable.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
