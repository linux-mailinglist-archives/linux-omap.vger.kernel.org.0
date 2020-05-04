Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1927C1C32EB
	for <lists+linux-omap@lfdr.de>; Mon,  4 May 2020 08:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgEDG3G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 May 2020 02:29:06 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44444 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgEDG3F (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 May 2020 02:29:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0446T3bI062423;
        Mon, 4 May 2020 01:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588573743;
        bh=3eQVjTEXYkA7I6pw3yE2vZ+G7qLcdgJX004KhW/OCbc=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=FiyTFTeHAmoNwTRylcl3MVSgQpEV4aRVhDl0yEtCHDG3iv6g0eTzq2v7Nq8FHS7Gp
         IdAf3Dc6S40zmO3RFzQMqa6hOscRNw/a4b7Y808RXTOC4KRkeM1LIJfV4j2+Jwlf9E
         akVEc/gI+wP15JzXCbKwIaJ8mels/FzLtv6iLQ68=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0446T2rw124504
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 May 2020 01:29:03 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 4 May
 2020 01:29:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 4 May 2020 01:29:02 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0446Sx3g039389;
        Mon, 4 May 2020 01:29:01 -0500
Subject: Re: OMAP36 AES and SHA addresses and hwmods
To:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
References: <CAHCN7xKe6DbNtjWzvXWFO4KMkvmmyaDDFnDWuMOKXi7B5CwJvA@mail.gmail.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <7b4ffe96-7d97-81c1-629f-af56018b84ae@ti.com>
Date:   Mon, 4 May 2020 09:28:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHCN7xKe6DbNtjWzvXWFO4KMkvmmyaDDFnDWuMOKXi7B5CwJvA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/05/2020 18:48, Adam Ford wrote:
> According to the dm3730 reference manual, there are supposed to be two
> AES and SHA engines, but the addresses of their IP doesn't appear in
> the reference manual.
> 
> The AM35xx has references to two memory locations for each:
> 
>     AES1 shows it's at 0x480A 6000
>     AES2 shows is 0x480C 5000 (matches omap3630 entry)
> 
>     SHA1MD5 2 shows it's at 480c 3000 (matches omap3630 entry)
>     SHA2MD5 shows it's at 0x480A 4000
> 
> Is it reasonable to think the other IP block addresses for the
> am3630/dm3730 would match the am35xx?
> 
> Currently in the OMAP3630, there are hwmods setup for AES and SHA
> engines, but the rng uses the newer approach with ti,sysc and
> sysc-omap2.
> 
> I tried to just copy the existing blocks to the other addresses, but I
> got some errors. I assume it's due to hwmods.  It seems like we should
> be able to convert the hwmods out, and add the additional addresses
> for the omap36, but before I go too far, I want to know if it'll even
> be possible.

All omap3 family should share identical address space for these IPs.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
