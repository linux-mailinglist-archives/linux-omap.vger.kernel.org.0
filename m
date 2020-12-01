Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252D22CA01D
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 11:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgLAKla (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 05:41:30 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44992 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725918AbgLAKla (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Dec 2020 05:41:30 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AddZl051332;
        Tue, 1 Dec 2020 04:39:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606819179;
        bh=/2EfTAhkMklMtoJDyYOTXlF61LFVeDz0d2N746kxDHw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yUiS+jVBciEoNsdCBm0DBEokkjVRwqehXQLMNzgJn5EI7jdTLW56fHeTdi+C21X72
         2NxL7PUrt0ENQKTT5XUVH5TIXqiRgJEige94DqYsIjdRYvQ7aD3aWKo+GtJBtzvSKD
         wVNt8mAtgnGqj1PRP1RnFdBOAIQP0BqlOCXSPqRM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1AddZr119247
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Dec 2020 04:39:39 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 04:39:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 04:39:39 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AdbeI052277;
        Tue, 1 Dec 2020 04:39:37 -0600
Subject: Re: [PATCH v4 57/80] ARM: dts: omap5: add address-cells & size-cells
 to dsi
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-58-tomi.valkeinen@ti.com>
 <20201130095358.GI4141@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <90a6fc14-78c5-f2c8-edb7-65fccde5fae8@ti.com>
Date:   Tue, 1 Dec 2020 12:39:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130095358.GI4141@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/11/2020 11:53, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:15PM +0200, Tomi Valkeinen wrote:
>> Add address-cells & size-cells to DSI nodes so that board files do not
>> need to define them.
> 
> How about adding ports too, while at it ?

We don't have ports for other encoders either. I'm not sure if adding ports helps or not, but I
think it makes sense to add them consistently to all encoders on all boards if we want to go that way.

> It would also be nice to convert the DT bindings to YAML :-)

I agree, but not as part of this already 81 patch series. =)

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
