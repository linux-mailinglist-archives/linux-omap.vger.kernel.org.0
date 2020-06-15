Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5660F1F8D6B
	for <lists+linux-omap@lfdr.de>; Mon, 15 Jun 2020 07:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgFOF4y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Jun 2020 01:56:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53642 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbgFOF4y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Jun 2020 01:56:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05F5umSH122595;
        Mon, 15 Jun 2020 00:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592200608;
        bh=iNm63oi4V+OHirtQgr0JauXGgDFpZ85faDOGakHExdY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Y7ZccyoPBvP4I1mmrpkv7AK326DZqxB87FdVchkWVvRvZZ8h/1/Z/FcMlosmLn0XQ
         m73kBWfs97PEL5H2hCECQp53M2gH1BAA0hj9w7+ogsxDH/6+VxVku7ROosfZ+PWnT0
         yQy1mUEl/HIoegH+wHg/sZK+nP/cpVs9MiEQN9/I=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05F5um4O072994
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jun 2020 00:56:48 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 00:56:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Jun 2020 00:56:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05F5ukTw125994;
        Mon, 15 Jun 2020 00:56:47 -0500
Subject: Re: omap3 dss failues on 5.7
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
References: <CAHCN7xLmhynf5X+2YgMTPcQMwEP4N_XE-BhVjcL1hT4L+EGuCg@mail.gmail.com>
 <20200613160242.GW37466@atomide.com>
 <20200613160601.GB9722@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d5416482-6b9a-ce53-9635-7ecf5697afde@ti.com>
Date:   Mon, 15 Jun 2020 08:56:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200613160601.GB9722@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 13/06/2020 19:06, Laurent Pinchart wrote:
> Hi Tony,
> 
> On Sat, Jun 13, 2020 at 09:02:42AM -0700, Tony Lindgren wrote:
>> * Adam Ford <aford173@gmail.com> [200613 02:28]:
>>> Is anyone else having DSS failures on the 5.7 stable branch using an
>>> omap3 board?
>>>
>>> I haven't had time to bisect yet, but before I do I thought I'd ask.
>>
>> Sounds this might be caused by some panel related between v5.6 and v5.7,
>> so adding Laurent to Cc.
>>
>> We also started dropping legacy platform data for some SoCs, but that
>> should not affect omap3 so far.
> 
> I think this is caused by the panel driver not setting the connector
> type. Only the panel-simple driver should be affected, fixing this
> should just be a matter of setting
> 
> 	.connector_type = DRM_MODE_CONNECTOR_DPI
> 
> for the appropriate panel_desc entry.

Yes. I sent one fix a few days back:

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg312208.html

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
