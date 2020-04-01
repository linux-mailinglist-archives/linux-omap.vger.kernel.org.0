Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CADE319AAD0
	for <lists+linux-omap@lfdr.de>; Wed,  1 Apr 2020 13:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732189AbgDALaw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Apr 2020 07:30:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36806 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgDALaw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Apr 2020 07:30:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 031BUS8e092486;
        Wed, 1 Apr 2020 06:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585740628;
        bh=UFgo/nIbXJkgEVmIcqNJbo8h9re6HvGHFQWIpgidyy8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kxkk9fN6B02JpY620HZteSNNxj1h1GBLfudYZucHYl+XKdGfM+uoZA+odK2zNXkfW
         eEEiaFYldFNfK2KZQ6cQolgxMDSuRvf3b8W4+YAtR2D7d5Vah5SO0Ug0ex9nGZhL6c
         igRlyQvzpbVPWnQ8A7ecNaBezJWW1xWzKig0v36k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 031BUSPx106117
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 Apr 2020 06:30:28 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 1 Apr
 2020 06:30:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 1 Apr 2020 06:30:27 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 031BUPrE012008;
        Wed, 1 Apr 2020 06:30:25 -0500
Subject: Re: [PATCHv2 10/56] drm/omap: dsi: drop virtual channel logic
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-11-sebastian.reichel@collabora.com>
 <20200225150117.GI4764@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <b3742008-1ac9-cf4d-62b2-b4afd904f2f9@ti.com>
Date:   Wed, 1 Apr 2020 14:30:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225150117.GI4764@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/02/2020 17:01, Laurent Pinchart wrote:
> Hi Sebastian,
> 
> Thank you for the patch.
> 
> On Tue, Feb 25, 2020 at 12:20:40AM +0100, Sebastian Reichel wrote:
>> This drops the virtual channel logic. Afterwards DSI clients
>> request their channel number and get the virtual channel with
>> the same number or -EBUSY if already in use.
> 
> I wonder why this level of indirection was used, allocating "virtual
> VCs". A single virtual indirection should be enough :-) I may be missing
> some context though, I'll defer that to Tomi, but for me,

I haven't reviewed the code yet, and it's been a long time since I wrote this code. But maybe this 
explains at least some:

(I hope I remember this right)

DSI packets have virtual channel IDs (VCID). That's number 0-3 that needs to be in the packets.

DSI IP has virtual channel "blocks" (VC), with associated registers. So 4 VC register blocks. These 
are not related to DSI virtual channel IDs in any way.

To do DSI transactions, you choose a VC, and program it. A VC can send data via video pipeline, or 
transmit and receive data messages created with CPU. And in both cases, you need to include the VCID 
in the transmissions, of course.

So, I think a normal use case could be a single panel, with VCID 0. To send video data and control 
messages, you would use VC0 and VC1. VC0 would be configured for video data, and VC1 would be 
configured for control messages.

And if I recall right, currently you first request a free VC from the IP with request_vc(). Then you 
use set_vc_id(channel, id) to set the VCID, used when doing transactions with that VC.

So the virtual channel naming is pretty confusing in the DSI IP, in my opinion.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
