Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7E0E10061E
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 14:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfKRNFa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 08:05:30 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40508 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfKRNF3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 08:05:29 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAID5C0o009396;
        Mon, 18 Nov 2019 07:05:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574082312;
        bh=DiXAJvtnHh9Q9iCq3goecT4OyreBV/nlqB9jEhvNnQ0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CTjDil/+woArUQE7/nSBmTe7dhsjPufKCiUNwac9o+0T7LOpW98lO4iue9CEXoWsm
         6s2VP8vQ2F3TEscL3rGgYnFdemXkVYcN190hlwqceXiD0zXk/fZfrJxr0b4b9678xf
         R33us4izD9TUhqjkloMqz/XnqkagH3Ycu2xHY/Xo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAID5BWn050438
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Nov 2019 07:05:12 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 07:05:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 07:05:10 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAID58Iv071096;
        Mon, 18 Nov 2019 07:05:08 -0600
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-12-sebastian.reichel@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
Date:   Mon, 18 Nov 2019 15:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191117024028.2233-12-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 17/11/2019 04:39, Sebastian Reichel wrote:
> The standard binding for DSI requires, that the channel number
> of the panel is encoded in DT. This adds the channel number in
> all OMAP3-5 boards, in preparation for using common infrastructure.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 +++-
>   arch/arm/boot/dts/omap3-n950.dts                            | 3 ++-
>   arch/arm/boot/dts/omap3.dtsi                                | 3 +++
>   arch/arm/boot/dts/omap4-droid4-xt894.dts                    | 3 ++-
>   arch/arm/boot/dts/omap4-sdp.dts                             | 6 ++++--
>   arch/arm/boot/dts/omap4.dtsi                                | 6 ++++++
>   arch/arm/boot/dts/omap5.dtsi                                | 6 ++++++
>   7 files changed, 26 insertions(+), 5 deletions(-)

Is this required only in the .txt, or also by the driver? This does 
break backward compatibility with the dtbs, and there's always someone 
who won't like it.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
