Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06A25EFD12
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 13:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730880AbfKEMUQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 07:20:16 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51580 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730870AbfKEMUP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 07:20:15 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5CJv8E012279;
        Tue, 5 Nov 2019 06:19:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572956397;
        bh=egMBHSs50qkAbX51jn8BKgOy3Skvkdbse0FoA9gv2yw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nyu98gX33peqY/m7fJzugpro2x6vdCBF+pw8pb8DG0qcTXro5MZf4e16f5KROcjHf
         W3lOWYpeIDPei5rBNrRXh7NFvEfi4LdYY7ADBRcpuqWHhRF0YBXJchFkn4TIM9zzuH
         97a4XBOOni2WO1t442es2mc/HIrK3p43LML2wbg8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5CJvMI048831
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 06:19:57 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 06:19:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 06:19:41 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5CJsIQ068202;
        Tue, 5 Nov 2019 06:19:55 -0600
Subject: Re: [PATCH 0/6] crypto: additional fixes for omap-aes
To:     Ard Biesheuvel <ardb@kernel.org>, <linux-crypto@vger.kernel.org>
CC:     <herbert@gondor.apana.org.au>, <linux-omap@vger.kernel.org>
References: <20191026145259.16040-1-ardb@kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <b8743ccb-2e3a-6d50-017c-48af6d3fa846@ti.com>
Date:   Tue, 5 Nov 2019 14:19:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191026145259.16040-1-ardb@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 26/10/2019 17:52, Ard Biesheuvel wrote:
> This series applies onto Tero's series [0], and addresses a number of
> additional issues that exist in the omap-aes driver that aren't being
> addresses by Tero's fixes.
> 
> Note that the resulting code is still not 100% correct: an issue remains
> where inputs into GCM consisting solely of assocdata are not being processed
> correctly, e.g.,
> 
> alg: aead: gcm-aes-omap encryption test failed (wrong result) on test vector
>    "random: alen=38 plen=0 authsize=16 klen=32",
>     cfg="random: inplace may_sleep use_digest src_divs=[100.0%@+19] iv_offset=31"
> 
> I have no idea how to fix this, so I'll leave this to people that know this
> hardware and have access to the Sitara TRM.
> 
> Note that I also spotted some issues in the SHAM driver, i.e.,
> 
> alg: ahash: omap-sha1 test failed (wrong result) on test vector
>    "random: psize=7928 ksize=0", cfg="random: inplace use_final
>        src_divs=[5.64%@+13, 59.70%@+18, <flush>31.53%@+4072,
>        <flush,nosimd>3.13%@alignmask+263]"
> alg: ahash: omap-hmac-sha256 test failed (wrong result) on test vector
>    "random: psize=960 ksize=37", cfg="random: inplace use_final
>        src_divs=[32.54%@+2449, 17.18%@+4, <flush>50.28%@+1] iv_offset=31"
> 
> All of these failures are triggered by CONFIG_CRYPTO_MANAGER_EXTRA_TESTS,
> so they will not show up when using the standard set of test vectors.
> 
> [0] https://lore.kernel.org/linux-crypto/20191017122549.4634-1-t-kristo@ti.com/
> 
> Cc: linux-omap@vger.kernel.org
> Cc: Tero Kristo <t-kristo@ti.com>

For the whole series:

Reviewed-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Tero Kristo <t-kristo@ti.com>

-Tero

> 
> Ard Biesheuvel (6):
>    crypto: omap-aes - reject invalid input sizes for block modes
>    crypto: omap-aes-ctr - set blocksize to 1
>    crypto: omap-aes-gcm - deal with memory allocation failure
>    crypto: omap-aes-gcm - add missing .setauthsize hooks
>    crypto: omap-aes-gcm - check length of assocdata in RFC4106 mode
>    crypto: omap-aes-gcm - use the AES library to encrypt the tag
> 
>   drivers/crypto/omap-aes-gcm.c | 119 ++++++++------------
>   drivers/crypto/omap-aes.c     |  33 ++----
>   drivers/crypto/omap-aes.h     |  10 +-
>   3 files changed, 61 insertions(+), 101 deletions(-)
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
