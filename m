Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 027372D5E6
	for <lists+linux-omap@lfdr.de>; Wed, 29 May 2019 09:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfE2HGv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 May 2019 03:06:51 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50666 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfE2HGv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 May 2019 03:06:51 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4T76XlJ104973;
        Wed, 29 May 2019 02:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559113593;
        bh=SB026D3ajxFdRIc7n9qxk9u1vBZJWW0jZuTDSvXX7t4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tA5SEkJn+6HHVMgi/Z+ltEZKF4o4sH9ly30+SnU0y0h6Oa6gbczSq+B9hWXzqX8L7
         R+pIFBZerml9joHBI9VKUgA61hhSY1VdN1yGdPbMXI8XpAEtHHo+SmPfzPSGZfQC7B
         e270M0jtMkAU3U4y+MkpjUv/iOxhTg9KbGMJzOrs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4T76Was037571
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 May 2019 02:06:33 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 29
 May 2019 02:06:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 29 May 2019 02:06:32 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4T76TGH091555;
        Wed, 29 May 2019 02:06:30 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To:     Tony Lindgren <tony@atomide.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>,
        Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ac487765-01a3-2c82-d86e-db00451563a9@ti.com>
Date:   Wed, 29 May 2019 10:06:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528101847.GN5447@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28/05/2019 13:18, Tony Lindgren wrote:

>> My board is x15 rev A3, attached to AM5 EVM. I've also attached my kernel
>> config.
> 
> Strange that this is not affecting other x15? I think timer12 would
> be blocked on HS devices though?

Seems that the kernel config affects. omap2plus_defconfig boots ok.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
