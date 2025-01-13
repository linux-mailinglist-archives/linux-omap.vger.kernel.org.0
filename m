Return-Path: <linux-omap+bounces-3096-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45278A0AF03
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 06:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B1403A6A04
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 05:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825DB231A4D;
	Mon, 13 Jan 2025 05:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtGL52a9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89D231A49;
	Mon, 13 Jan 2025 05:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736747803; cv=none; b=eKlrDcJek17Z4VgymJLIW1W4jZ93Q8anq7Dd8Op2Pil8wWYZug605wSXFZWxGIIaI9u/xjax2xVInfGaadxH7BTcgrjIiLIqgBY5K6AAwhhXLJeP1h0yu5aZ4UG3BU+pslM+wJJxc80R5/I9FryrRZ58rv8Ta+EpczXiTokqKl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736747803; c=relaxed/simple;
	bh=1OcVdR8QXo7h7I9CrTdObAst3NnP9BFHsBeH404rn5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqfug+C6Up9/MPQz3qQZJaDpX4MHGs6SViZx24hm0QiFWqL4DCOMkRt3Y0aSUSZnY9uySmhDWOl2JJi4VbVrQ7LyrTpK65M4r5YG09KmyAy4xiaOiMHTY0TSa+E88k7eL/yay/PFnH/3lOomyP8ZNocRnBE/uCUtnUtqIO6PMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtGL52a9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaecf50578eso772116866b.2;
        Sun, 12 Jan 2025 21:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736747800; x=1737352600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsALnG9/Q3jBM38ejFycw2fZLXx4mUZU9n4CJ679lYQ=;
        b=HtGL52a9/Tj3YE0vTTCSMkOkbDRZyxx+kELT55tbd3H58foJQcH0AhBRoga6r0JDH8
         HmT/pmKuptoRw1SG3a8jnVFwY/MosLDo8+2DSkOWuqcu6H3t1ZSRfcgAtl1wkOVSes7j
         gzUj9LKk0s2+TCXUAbxuyFyclJxjuXqAvqPM7ezxfdlXk1wWMaSQmfbTQu6VHRlAORpa
         rUjGSkUY0xADWCdsE6DJP+tqjV4DUJrl3hr5kHTf/lML+REvBrV+wY9lmTKofvJGGMme
         ghde5GOzH32iUgRuajCcI5IDcRa84iDhhJf1st8jaYJBRdUaxx3jEpKW1Ik76W4Qvf1R
         5MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736747800; x=1737352600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsALnG9/Q3jBM38ejFycw2fZLXx4mUZU9n4CJ679lYQ=;
        b=fM/mvaQ23HIKpU1o82FziElfW6VF2xf5vnaLiYhXZyogRkHkgfMuhy6p+ktBQ8qcUD
         Q7n5Mbq+o3qT6SaZuKlWkp8SrxBB7X7+n0Uv6FaBcPeEuKk7C6Gfnii6WqaqaoMDvMEH
         5a6Pt3g1yHKSAKL/UxzypQWbz2iVMXm5ej9BvLgCC+P3Ud7AXOCp3nyfSUGBX+OHP+mI
         mF95p8OZWQDfigxCMymp1bpvtzyqJrhuDOHXwIzEC4AbcT+MMkzq4slk2pgReVcy8oql
         Ex67SZuvjh3KCq/Nvm6jiaD7o2Q/mql3U4giXpszblxAB8EiGmFbtz/QuY9S2ebm9J0y
         RiYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoBtbM4wx6iTpa4cY1zPsfoF1q2ruZprj1jX6DLZmkPlybIXGddsbpUthFKPywdLlSFvfn2KaQ0Wum8Q==@vger.kernel.org, AJvYcCWh3b4NDyMTTgV1imZ5vQCq7dm+FT/k5eWva79IbzbCVqZJa4ZCze04QnWsrSxiwK6UQibFh33PdHmA9N4=@vger.kernel.org, AJvYcCXYjv4SWW9Nk888tTU3HE6j+EtwSBkQ+o5e+xGoj5eP4SdSry4B4UFyyJoMG8hkZ+ftXCaeKm0AAhbFgHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbWowYxLEkfrZaVt+yL8Sc71mtljq9bdCBKyv8d63Dd55U4MN+
	GwrwPCDX+/lO2l3IEa5nW+/Az9b5g24VnSBjQEOwy1jJ5kEtP6XWXrxu5A==
X-Gm-Gg: ASbGncv05MrKyibvo2chfXsHcMp9VBnTETdqEuaKPPFi28moJAZUWO5+dqyBbpgLQYs
	nFzROapF+9k8qNJqhICv9ta5O/AJC5gqD7jieN1uqceGlbMApQdePe5Ci+dI6P0mVGosTHa7zsR
	rRrenQBMb0Gl6KnvZ2Ao6m5bUG/HggO/09wk6w8wcyOKOqBpXrxM4+Q0aDdHAL7oSbxTkb8rul/
	S8Wogh1v1L4WBDU90TS2+R+bb48+NcOM8BSGCNZsxe9ZMsHfLoqNyyTYffwpXmuR5zxrg==
X-Google-Smtp-Source: AGHT+IGV0nYkYjJVPqWOd5aTZADzdU5bEMNbbXVQ393U2Hur3U0GrL/ykyQaGM250ELY1CffgHr8nw==
X-Received: by 2002:a17:906:1196:b0:ab2:eb1a:9471 with SMTP id a640c23a62f3a-ab2eb1a9d1cmr767396266b.48.1736747799518;
        Sun, 12 Jan 2025 21:56:39 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c90dad57sm458909566b.66.2025.01.12.21.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 21:56:39 -0800 (PST)
Message-ID: <a35c8cfc-d7a1-4c3f-9541-ee247e2490f4@gmail.com>
Date: Mon, 13 Jan 2025 07:56:38 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] ASoC: cpcap: Implement jack headset detection
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

ping

On 28.12.24 г. 13:45 ч., Ivaylo Dimitrov wrote:
> cpcap audio codec found on cpcap PMIC supports headset detection
> and PTT button through its 3.5 mm jack. This series implements
> support for those capabilities.
> 
> Ivaylo Dimitrov (5):
>    arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
>    ASoC: cpcap: Implement .set_bias_level
>    dt-bindings: mfd: motorola-cpcap: Document audio-codec interrupts
>    arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection
>      interrupts
>    ASoC: cpcap: Implement jack detection
> 
>   .../bindings/mfd/motorola-cpcap.txt           |   9 +
>   .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   8 +-
>   sound/soc/codecs/cpcap.c                      | 200 +++++++++++++++++-
>   3 files changed, 215 insertions(+), 2 deletions(-)
> 

