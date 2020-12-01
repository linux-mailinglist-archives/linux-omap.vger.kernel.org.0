Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B272CA111
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 12:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388663AbgLALNr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 06:13:47 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55872 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbgLALNq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Dec 2020 06:13:46 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BC3ww041170;
        Tue, 1 Dec 2020 05:12:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606821123;
        bh=mZgPRoz2JXp5Fajh2RT2zFQpgdlWwMfnapaJ6D9j9Ns=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=y7imEuSmHhclZSaYYxFgcU6FG+Xojy3w/rNstWtJp9Bgct6l57s0rHmkzwTuXVfXR
         IGSHNH85XvX+3mkGL4blHxqpQ+Zha+CA45JlMzaPcHxaScUWZTEgHdX+2IcAx6tr7C
         9WjgIp4Jlpm5BpeDZwF1H9y0kK7+JZgW+x9iS6Wo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1BC2tp035791
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Dec 2020 05:12:03 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 05:12:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 05:12:02 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BC0U5110441;
        Tue, 1 Dec 2020 05:12:00 -0600
Subject: Re: [PATCH v4 62/80] drm/omap: dsi: simplify VC handling
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-63-tomi.valkeinen@ti.com>
 <20201130100034.GN4141@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <02c6614c-c667-dfde-427f-0eec1565fab6@ti.com>
Date:   Tue, 1 Dec 2020 13:11:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130100034.GN4141@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/11/2020 12:00, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:20PM +0200, Tomi Valkeinen wrote:
>> The VC handling has gotten quite tangled up. As the first step to clean
>> it up, lets define that we only support a single DSI peripheral (which
>> was really already the case), and we always use VC0 (define VC_DEFAULT
>> 0) register block to send data to the peripheral.
>>
>> We can thus have a single mipi_dsi_device pointer and remove the for
> 
> s/the for/the need for/ ?

Hmm, no, that's not what I was trying to say. Maybe it's clearer with a dash: "remove the for-loops
which..."

> 
>> loops which made passes over all the four VCs (just the first one was
>> ever used).
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
