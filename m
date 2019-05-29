Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B09F12D91D
	for <lists+linux-omap@lfdr.de>; Wed, 29 May 2019 11:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfE2JdD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 May 2019 05:33:03 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41362 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbfE2JdC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 May 2019 05:33:02 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4T9Wnxm013499;
        Wed, 29 May 2019 04:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559122369;
        bh=2CV8kVGEL0DMRiySLsnj3/iJiNMR+R8ZgD7i62w7GMA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dNt+pk8f/F0CeV2V0M1owj47aWo7uhBpsHFxJ+wZmllgADPY9uTdoLqiVILdgYdcy
         PYqSduIK6wqutKVyYF9FI/tZcc2VMdPGSLXOHeCQziQuyY55QM5z9UoMha/UcuX+J/
         yhuasD8cnxZ5scS9dhXv2BFnZYyl7Q0xCkwe97ag=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4T9Wn1t074537
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 May 2019 04:32:49 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 29
 May 2019 04:32:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 29 May 2019 04:32:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4T9Wkn5043713;
        Wed, 29 May 2019 04:32:46 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>,
        Keerthy <j-keerthy@ti.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
 <c2eaee25-a0d3-2632-fdea-3a81ac7085af@ti.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <0f124d61-b2ed-2b7f-f63a-0b478473c8fd@ti.com>
Date:   Wed, 29 May 2019 12:33:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c2eaee25-a0d3-2632-fdea-3a81ac7085af@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 28/05/2019 13.32, Tomi Valkeinen wrote:
> On 28/05/2019 13:18, Tony Lindgren wrote:
>> Strange that this is not affecting other x15? I think timer12 would
>> be blocked on HS devices though?
> 
> I don't know... I can't believe my x15 would be unique =). Can it be
> something in the kernel config? u-boot?
> 
> Peter should have the same A3. Peter, can you try with my config?

It did not boot with your config.
My config boots, I'm using SLUB.
Flipping CONFIG_SLUB_DEBUG_ON to y and the kernel does not boot.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
