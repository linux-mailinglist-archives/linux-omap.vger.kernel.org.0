Return-Path: <linux-omap+bounces-4947-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F42DC6B3E8
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 19:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1AC6E29D2B
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 18:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1BE2DE202;
	Tue, 18 Nov 2025 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VFMggGLa"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-il1-f225.google.com (mail-il1-f225.google.com [209.85.166.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510BE2BEC20
	for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 18:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490921; cv=none; b=uSD7XT9evTIhQ0Hy05xsSZpGOIkAnQZ2LtIOj2X/TNZGMPNBmmU4Iw2bYKBLfeDDtTtRWIQmdTBLEh0847E63kBCizERf9ItrYfZxEvxUpmBYCDvcQxN4uT79++mnT6d9GXUsENccwBNMgtKJUkFhRz/fuGcs/2u6g5prjQKzEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490921; c=relaxed/simple;
	bh=EJ50Gm0aIYUS9tCqR37i55xeKh9MvLGcTNJmeFc23Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OL2zWwlWOD4tTuzvVDMjvf3nWnN1iYY0/RpCh3J64Qc6zPHgU6ToF54kzqqSnejzsZBlptqKoWNc/sdg3ws9Bvei0X2chOmR0GYIKd81SIduLYeKHF0xhxUfP4iqLjr8zkTcAjR/vLGmdQn3rmhWIoVt0Mdqh1OS5pIxdJcv0jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VFMggGLa; arc=none smtp.client-ip=209.85.166.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-il1-f225.google.com with SMTP id e9e14a558f8ab-43377ee4825so29044065ab.2
        for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 10:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490918; x=1764095718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6escJsy+cDt/xGuVF5sLz1hYdQq4kG1CujcTZp9D/YQ=;
        b=syXzyzdCughlSQk+sjNhFlLKn+Ml9Xef8tXZ/+1toL3KkpZAvRemKmZEsaB3wxJ+9s
         4xO8WKL6RiUNG+Q457hNwdN5ngQXh4J2MmxAQq+TWLORLxAEWaWtyvbEE61CGcABXePH
         qEuafuQGXy2fZX73VELrPqCBKVT+ZyTRoe5ORdDp6fZAJOR+fSLVERCHEBYdZ3fJRiPz
         CXbfnMBvbSa5LyHTOkuW4vBYiz4cqPc44uV4MWvME046XEUZynQvoQpVehF8CjwKjXfY
         KJhOsgDbILqJ4UfyQixT/jEmMlFE0k23UiyNAHeS6oc/zTlIFKziITtqSbefZIET86O+
         zQKw==
X-Forwarded-Encrypted: i=1; AJvYcCVMVQ3hNqaYAVOq3VQ3Bw6XAsWcXTkMjyXY/vM7oVOIN1RM7ZyQjLSbmLL5MgdJBNvEWBIflKv2ya+k@vger.kernel.org
X-Gm-Message-State: AOJu0Yww+yG57sgdDCJ5x5JRhYuMEXXgVP0L/6iInm1HiOuHROz/b46Z
	I5lKvztsJviUvDy55RJ1pst0+qu6xsujuZdg+g9oEAjQ69cpmIeirr9xRijDwsVQwXNfIJOcM9p
	86xDHzPRtuvHicibboaS2hnlgUVZFr4UdMlk/+wBWUVvuYFcMYYelQpF1qjCnAb6mn+HUX1xjxh
	6vhxSRzGleFrwH7AHv7FuwoU8CDC19ydEyjhC0UcfxxL85x0Y7Ub6m1B+Xr8KY9T05a6hS3Fexy
	nbTgwd7+obN8H4y1ve5HQ==
X-Gm-Gg: ASbGncsQ9j2l5I3N8k/8sW4y6xG50gIsnhM96z4m7iZF0Wedx6ZhHZdFeUQCP8vivVk
	WpMfsUxhMwq/xt/dXr7tslJiCwXVWHf8AFXPGvUUAwYWQqv/P4QXj2lq9IVZKDs1onC+ylIov2E
	C8B/eLx6b+B/0OPFzrHRAi5TKNC2y+Zi70VqpbYq9UnWbMoGql9TUtZqeKbg1IprHrMsYD9TAtP
	ucj4sHdBy5X1aNip720WrZtamtrK8dLjuF77uH6iUe/q37tun4tfZy/MW6BDZi2aaHNLLMQkqrl
	7wexyGY1bQvsrjjxNjjUbgeK52ndLwydm3hmntLxjTf3XxAo/F90It6Jr1icyYWs3HM+TE6ezrR
	dj7wOOG4Cj3kh8YCP7550sHzhJxFWy2aQe7AfDQvKGjB5rv/jEn9TRgh2XrVM/+id7K2fVvgj/b
	anRg03seTsUm4jS/1D+1uah2Exg53irt44BACglpVK2PdnHpR1k0ky
X-Google-Smtp-Source: AGHT+IHuDGDH06alprIFy3fDeXp7JETYXjveGOKmoIoQiay0bBBmivjI1bOAvyCXZXJOcfU+DCSgaL0L+PvI
X-Received: by 2002:a05:6e02:148d:b0:434:96ea:ff5a with SMTP id e9e14a558f8ab-43496eb0099mr165377085ab.35.1763490918121;
        Tue, 18 Nov 2025 10:35:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-9490863a434sm39122439f.8.2025.11.18.10.35.16
        for <linux-omap@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:35:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc169af24cfso4672196a12.3
        for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1763490916; x=1764095716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6escJsy+cDt/xGuVF5sLz1hYdQq4kG1CujcTZp9D/YQ=;
        b=VFMggGLa3J/NDys4Q+IExS5At5YfQ+XQBDnesoI83fG33JFufRrQi0YDn5K3SOhvxl
         2pRvhrV5MnYsUlmHemxlsskAJXt5H1d0/KUnfPR57xIF59Yeid/2xAnMjiZihXln7oKE
         p30foitJpD5W5Et/UMospH+ZYZRLCFejHvePw=
X-Forwarded-Encrypted: i=1; AJvYcCUzd3IdTQtRRqu3KtTaFcIp6sTuzxWVJzAG7v4fU0JouOL5e+p275cKbYcxA9n6pKH5NHEi+eKuaAny@vger.kernel.org
X-Received: by 2002:a05:7023:b07:b0:119:e56b:98b9 with SMTP id a92af1059eb24-11b41306c47mr8310679c88.32.1763490915765;
        Tue, 18 Nov 2025 10:35:15 -0800 (PST)
X-Received: by 2002:a05:7023:b07:b0:119:e56b:98b9 with SMTP id a92af1059eb24-11b41306c47mr8310641c88.32.1763490915104;
        Tue, 18 Nov 2025 10:35:15 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608860fsm52865160c88.5.2025.11.18.10.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:35:14 -0800 (PST)
Message-ID: <6466b7da-eb8d-41d3-b3d5-9845eb6067a2@broadcom.com>
Date: Tue, 18 Nov 2025 10:35:11 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Hoan Tran <hoan@os.amperecomputing.com>,
 Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
 Romain Perier <romain.perier@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-3-jszhang@kernel.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20251118003229.26636-3-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/17/2025 4:32 PM, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Doug Berger <opendmb@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


