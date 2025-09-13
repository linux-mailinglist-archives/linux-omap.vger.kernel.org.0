Return-Path: <linux-omap+bounces-4632-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FA6B5629B
	for <lists+linux-omap@lfdr.de>; Sat, 13 Sep 2025 20:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DC927A6140
	for <lists+linux-omap@lfdr.de>; Sat, 13 Sep 2025 18:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4560125A9;
	Sat, 13 Sep 2025 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLn3vU3e"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB122B8BD
	for <linux-omap@vger.kernel.org>; Sat, 13 Sep 2025 18:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757789364; cv=none; b=k+Gbozn9CgL7j02ckukwYUuWIdgAWL+NSIDwH0xMPGM4vGt3NFAN376TPU9Fd108jqZJjlzphlnXfTxkuVboH5sJ5itZYVI/uVzbGCNzffZbTpijvt/FhKiVPw54DQ5WgTY2l68nS54xoKKCCVWFAFBW0//KZDTqJDHyYxW1+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757789364; c=relaxed/simple;
	bh=If4Dx8GnGsI9EAn+Csky6KF5QogT6E3JWcOUF8Exyug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9nAsHFe3xR5gBNQnstQMrlNIBy6oxAj9QeqepnJ8+HUz5HhFSoPGPxBiqkZ2Ck8XqpH1c9gOazySV20XPhT+7s2c9j/l3s/Yr3ggrQ0qQU0t5NpHCn+mPUqMuVesnWmhzUw3ZNd3IUisKioGtv20v5/DvRPx+jA4o/xxKeAuHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLn3vU3e; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so2561578b3a.3
        for <linux-omap@vger.kernel.org>; Sat, 13 Sep 2025 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757789362; x=1758394162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rF3GBCGcRqV69CZBLaKsXGjUvkwSYhGDg0qUaj1ycYE=;
        b=bLn3vU3e8T50AEZHqvp91RBvtEh7tO2VWyN4zSS1BsInQyQho0KLVaPw4gtwgkT5O5
         IpNJ1A6lkpgBOgTP5JYiGZzjnIJNPWhzE5IzW+WtiRmR20AqB5IH83CuoX1KKRvTCCGc
         FLrMqSArEmXsge8MoS2c3VcGiop0OoCpEDuHlyKfgCgK+E87YH1o+L3isZzVDqWyB3x/
         uXcrXZaHhFacnJs1DbdzFI2FZoEMcbzHp7MksLrjbOj0Y0CjjJckObUAkRr+2hq2BaZg
         fIGzShRt+rUUc9//cn8goyALhqAXbwQoLh5sQ3pqd1Dt59nlKj7AivgjS2XMgqTsCLQg
         sLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757789362; x=1758394162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rF3GBCGcRqV69CZBLaKsXGjUvkwSYhGDg0qUaj1ycYE=;
        b=aainnPCYRqUZgtJZZUFdVqSx4lhtlKXhWiErnY6DgxphmMV7HiUSTkW5IvsOmaXvyg
         V3s5eMZ7/3P3LxyZNBs54xAh0JKRU/YQdBZHfOo6YViLnrlWEYR/N7O33LlgBAq4fyfm
         D3YjdwHtA4kjGKGcJyw56t8hvFepZXSXFngYApuBvZF6h+6x2JBjHd8WEEVJXXT2uvte
         3Gi72/pXYqlr2v3hOSvt+G0NsEBWtHdUzrg/Uy5wPDOR0BC+qofaQYzJBu0XUyzJhoKF
         h2ON3X1xQwd+sa1j70Iydizns5rUvqy51b8iKiREFqmsP4LmgiSCtM07oiHkvb8zfx0W
         h3BA==
X-Forwarded-Encrypted: i=1; AJvYcCWCDwXU7bf8GM+Qmr+FTH6/0tgrSB/eXvxGaK7lKsP9q/YUlr3mwxWmfPkJG8uPXYc9HKNtx1zCOO8G@vger.kernel.org
X-Gm-Message-State: AOJu0Yyok4lcazpPZ4yYEEAd4phLMhSzzmWCD22tomjtdkYqlLeHChb0
	G+w3PWd78t8x50+d1Xn97qU0uWyzUiWVqJLacGp73Mfo0dw7Q0GRqmPb
X-Gm-Gg: ASbGncu/gAAJCMRnwKwLe2mn5OHxdEsT0mkBefgT22RMeCGvW5lutvKWrg7Fd3cAFck
	xS7giYaFsRt+0Rm1zGhNd9VQoetjesFaIIxbnZ10pYXYNzjqhRVnGNrGSDwt8f1ldywLVZdNeKu
	NG377JsDM2TraK+TQv658oMiYOcD7TaJPodRA5+8VVDnvdguJo0GVhvZy+ovhIURedEqhN4yWNh
	up7yxdeZ5DURCeMOpT3UiizJN6owwEvLOrjcu4sAQkq4DXD4nAjLG6Lc/Nqd39fP+9t8oTEZDbj
	97pzRg8qUqz24Ux63e6l/uLVyXWfE9IKgNQJ2X7JaTBdiskZ8o3Skd/PcjVryODNteQE0W1BDct
	G9c+0dopqY0kjiTXO+OgwLsJA9mMyoVQziTK8KvmmwSmWlWD1iGbzGSfHBw==
X-Google-Smtp-Source: AGHT+IER3H6K6+0dTJYxwoJBwqd4juH0cQSJgRMY2gXd9jT2iPi/p7I16dBYJ0ZSS5sqJlCrdMRqag==
X-Received: by 2002:a05:6a20:2449:b0:252:f0b6:be9 with SMTP id adf61e73a8af0-26027c23f4fmr9459029637.0.1757789362176;
        Sat, 13 Sep 2025 11:49:22 -0700 (PDT)
Received: from [192.168.1.6] ([223.181.119.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54b03cf65csm4920585a12.16.2025.09.13.11.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 11:49:21 -0700 (PDT)
Message-ID: <501a4e0a-2d6e-4a57-9006-91413bd2ebb4@gmail.com>
Date: Sun, 14 Sep 2025 00:19:15 +0530
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm: dts: ti: omap: Drop unnecessary or unused
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>,
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
 <20250908-ti-sdhci-omap-v2-1-72927890482f@gmail.com>
 <20250909-uptight-fluorescent-markhor-4639db@kuoka>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20250909-uptight-fluorescent-markhor-4639db@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09-09-2025 12:50, Krzysztof Kozlowski wrote:
> On Mon, Sep 08, 2025 at 04:17:12PM +0000, Charan Pedumuru wrote:
>> Remove unnecessary properties like ti,needs-special-reset,
>> ti,needs-special-hs-handling and cap-mmc-dual-data-rate from the DTS
>> files as there is no user of them.
> 
> No user? That's not true:
> 
> git grep ti,needs-special-reset

Should I remove ti,needs-special-reset property for the compatibles "ti,am335-sdhci" and "ti,am437-sdhci" instead of removing for all mmc nodes? ti,needs-special-hs-handling and cap-mmc-dual-data-rate were defined for board specific, so these two properties should be defined in the YAML file to resolve dtb_check errors or can I remove those properties for those boards too?

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.


