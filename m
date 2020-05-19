Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CD41D9BC3
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 17:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgESPyz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 11:54:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36122 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbgESPyz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 May 2020 11:54:55 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04JFsrKF015912;
        Tue, 19 May 2020 10:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589903693;
        bh=nMmZdAMSTdo+Few//kaA04rUL9QSLPu0ZkbEG5G751I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tzXB5NPxVZgdcuErgH2XhDD2tHP34qrqvHv99i/T/4oduUKxwuaoFQbqo37UddyZd
         mYHqKV9ZhascTvMhQ9sI3ICFdpHIPDYnzmfOktR7aUynXnrvz4bDnhtxFcCaFOu6cg
         BqLM+EV/CD2AzURGJaJpIOufKfD+SblxKZjc/VvA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04JFsrwd034965;
        Tue, 19 May 2020 10:54:53 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 19
 May 2020 10:54:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 19 May 2020 10:54:52 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04JFsp5M083116;
        Tue, 19 May 2020 10:54:51 -0500
Subject: Re: [PATCH v2] arm: dts: Move am33xx and am43xx mmc nodes to
 sdhci-omap driver
To:     Tony Lindgren <tony@atomide.com>, Faiz Abbas <faiz_abbas@ti.com>
CC:     Keerthy <j-keerthy@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <bcousson@baylibre.com>
References: <20200512203804.9340-1-faiz_abbas@ti.com>
 <20200513162327.GM37466@atomide.com>
 <94025425-95e2-e53d-cfac-a1e73e6c011a@ti.com>
 <53c815db-dd7d-e6e1-f81a-cf05ef340c71@ti.com>
 <20200519154807.GT37466@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e37ed4be-aed5-8051-a9fd-c0704d947d75@ti.com>
Date:   Tue, 19 May 2020 18:54:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519154807.GT37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

(Dropping DT from cc)

On 19/05/2020 18:48, Tony Lindgren wrote:

>>> Suspend/resume on am43xx-gpevm is broken right now in mainline and the regression looks
>>> like it is caused by the display subsystem. I have reported this to Tomi and
>>> its being investigated.
>>>
>>> Meanwhile I have tested this patch with display configs disabled and Keerthy's
>>> suspend/resume tests pass on both am3 and am4.
> 
> OK great thanks for checking it. Do you have the display subsystem
> related commit that broke PM? I'm wondering if my recent DSS platform
> data removal changes might have caused the regression.

I spent a bit time looking at this, but unfortunately I wasn't even able to resume my AM4 evm from 
suspend. I tried with rtcwake and with plain console (with no_console_suspend). I did not have DSS 
loaded.

Anyone have quick hints on how to debug why resume doesn't seem to happen?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
