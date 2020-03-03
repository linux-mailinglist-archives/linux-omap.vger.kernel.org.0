Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76819177A88
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 16:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgCCPfg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 10:35:36 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43392 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729537AbgCCPfg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Mar 2020 10:35:36 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 023FZNri088793;
        Tue, 3 Mar 2020 09:35:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583249723;
        bh=We9hKUOb5/GmeQY53Xtn0VT7EhC2TrryfAgJsKh1aYc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=WKRGqnxHkAr8CnJvXox0Sb4qtkXxzfGnF+W16wliI8Sf6j0VfYxBXUIZ94TZ9wuSe
         5P5+wlsPGYplDtANMyXJI1MKZusiefLeCG8FbLUxApE2RWBFjZalf4J8/2/OMuCuEV
         W/vk+K2MKv4uSkUF6KUxJhqr3k7ELgRAP0DyEU5c=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 023FZNKn047025
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Mar 2020 09:35:23 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 3 Mar
 2020 09:35:22 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 3 Mar 2020 09:35:22 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 023FZIKM112679;
        Tue, 3 Mar 2020 09:35:19 -0600
Subject: Re: [PATCH 3/3] bus: ti-sysc: Implement display subsystem reset quirk
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-4-tony@atomide.com>
 <7d4af3b5-5dd7-76b3-4d3f-4698bfde288c@ti.com>
 <20200303151349.GQ37466@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8cadd536-668a-4309-1878-7db2362717d2@ti.com>
Date:   Tue, 3 Mar 2020 17:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303151349.GQ37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/03/2020 17:13, Tony Lindgren wrote:
> Hi,
> 
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200303 06:03]:
>> On 24/02/2020 21:12, Tony Lindgren wrote:
>>> +	/* Remap the whole module range to be able to reset dispc outputs */
>>> +	devm_iounmap(ddata->dev, ddata->module_va);
>>> +	ddata->module_va = devm_ioremap(ddata->dev,
>>> +					ddata->module_pa,
>>> +					ddata->module_size);
>>
>> Why is this needed? The range is not mapped when sysc_pre_reset_quirk_dss()
>> is called? This will unmap and remap twice, as this function is called
>> twice. And then left mapped.
> 
> That's because by default we only ioremap the module revision, sysconfig
> and sysstatus register are and provide the rest as a range for the child
> nodes.
> 
> In the dss quirk case we need to tinker with registers also in the dispc
> range, and at the parent dss probe time dispc has not probed yet.
> 
> We may be able to eventually move the reset quirk to dispc, but then
> it won't happen in the current setup until after dss top level driver
> has loaded.
> 
> We leave the module range ioremapped as we still need to access
> sysconfig related registers for PM runtime.

Ok, makes sense. I guess a minor improvement would be to unmap & remap once in 
sysc_pre_reset_quirk_dss before calling sysc_quirk_dispc.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
