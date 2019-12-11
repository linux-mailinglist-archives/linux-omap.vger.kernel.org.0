Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E16811A596
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 09:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbfLKIGz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 03:06:55 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34806 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfLKIGz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 03:06:55 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBB86mv8006806;
        Wed, 11 Dec 2019 02:06:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576051608;
        bh=mOo3X913MURdWVK6AGmWfZO/2ASkFz5lZ7wwHiHxcT8=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=UlquYBTfgOLf4kNT/JOfOxjAu4B6oXdmxKgZi1hfbEKYNKNjP6S1QcaJJR+YOSxc6
         b/DNifPknooZ2L43mB8auxjiL+uKLJyGJ59vPdRYS0dbJ+Zi/EA1hz6RVo23k5OkTr
         igbz2jNzp/JWyJmN7EPKnYb3PG9ovgQ+27F4cA80=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBB86mNZ020608
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 02:06:48 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 02:06:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 02:06:44 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBB86gNN028345;
        Wed, 11 Dec 2019 02:06:42 -0600
Subject: Re: [PATCHv2 00/22] crypto: omap-sham: fixes towards 5.5
From:   Tero Kristo <t-kristo@ti.com>
To:     <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
References: <20191105140111.20285-1-t-kristo@ti.com>
Message-ID: <ed703784-a035-fda2-51f6-869daf3cacbd@ti.com>
Date:   Wed, 11 Dec 2019 10:06:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191105140111.20285-1-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/11/2019 16:00, Tero Kristo wrote:
> Hi,
> 
> This series applies on top of the skcipher API conversion patch from Ard
> Biesheuvel [1].
> 
> Fixes any known OMAP crypto issues with the crypto manager test suite,
> including the extra tests. Tested via ipsec, tcrypt and with an
> rmmod/modprobe loop while the extra tests for crypto manager are enabled.
> 
> Couple of additional bug fixes are also done, like proper cleanup of the
> sysfs entries, and huge data handling for SHA.
> 
> Please note patch #9 is not related to omap-crypto, just a nice to have
> tweak for testing purposes. I find it quite annoying myself that if
> the HW engine is broken for some reason and hangs, the crypto manager
> test suite does not throw any failure for that but just hangs itself
> also.
> 
> -Tero
> 
> [1] https://patchwork.kernel.org/patch/11188595/

Herbert, are you planning to pick these for 5.6? These apply cleanly on 
top of 5.5-rc1.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
