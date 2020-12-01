Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249E82CA0BD
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 12:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730207AbgLALA2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 06:00:28 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53320 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730205AbgLALA1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Dec 2020 06:00:27 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AxL0s036578;
        Tue, 1 Dec 2020 04:59:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606820361;
        bh=i4cgKS/QFFgGqhHZNPCQGPkZq4i4HGbJdagbl5kQUz4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tNd4/9jnh1F4/div+Bt+uiYiyHGnDt1gq140DI5hQVjvw77oKpg28OZDuowaawKyR
         Rx8Ix5AxSF7Vsl1yp1Mi/lOJ2LxoxqqnsxisYTliu6TfazkwwWcz/bACfkmm1UhXgS
         xj42iB7D4nB03X9D8noWGnKgkR2bYRcpy/IhoM/k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1AxLRg018252
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Dec 2020 04:59:21 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 04:59:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 04:59:21 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AxJ9W009378;
        Tue, 1 Dec 2020 04:59:19 -0600
Subject: Re: [PATCH v4 61/80] drm/omap: dsi: send nop instead of page & column
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-62-tomi.valkeinen@ti.com>
 <20201130095837.GM4141@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5ba290be-8b5f-bf67-6f1a-2bcbbd7a7108@ti.com>
Date:   Tue, 1 Dec 2020 12:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130095837.GM4141@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/11/2020 11:58, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:19PM +0200, Tomi Valkeinen wrote:
>> The OMAP DSI command mode panel driver used to send page & column
>> address before each frame update, and this code was moved into the DSI
>> host driver when converting it to the DRM bridge model.
>>
>> However, it's not really required to send the page & column address
>> before each frame. It's also something that doesn't really belong to the
>> DSI host driver, so we should drop the code.
>>
>> That said, frame updates break if we don't send _something_ between the
>> frames. A NOP command does the trick.
>>
>> It is not clear if this behavior is as expected from a DSI command mode
>> frame transfer, or is it a feature/issue with OMAP DSI driver, or a
>> feature/issue in the command mode panel used. So this probably needs to
>> be revisited later.
> 
> This is important information, could you capture it in a comment in the
> code ?

I think this is related to the following (from DSI spec):

"To enable PHY synchronization the host processor should  periodically end HS transmission and drive
the Data Lanes to the LP state. This transition should take place at least once per frame"

And in OMAP TRM:

"Special care must be taken in the case of the last line of the frame. The LPS transition is
required when the link is in HS mode for the whole frame."

I'm not 100% sure about that, but I'll change the commit description and add a comment to reflect
the above text.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
