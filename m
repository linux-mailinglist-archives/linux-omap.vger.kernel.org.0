Return-Path: <linux-omap+bounces-1399-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 607778CDB57
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2024 22:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 842E01C210C5
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2024 20:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F9E84D3A;
	Thu, 23 May 2024 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRK+qRtZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02CC80632
	for <linux-omap@vger.kernel.org>; Thu, 23 May 2024 20:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716495910; cv=none; b=rlv9EOcI82BQjwKjlv0Ks+Cfq/uDq4Zg4N918/hCPrFmNqQ78GSVVYHw+w5xQlGM4XUrb1I6OAdDCUjK5oeg5zTCXgTpky1Q2fWbfpNpe/64bvCp6q6oeX6u8RzkYAmz72jj6s/HDSDn97lE3CJ4/PgUsY9v2kPSjvHYOwMeJKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716495910; c=relaxed/simple;
	bh=T53Qq6geUKMePsO3PpM709s0ZqBNoDAk8S13cUqTa2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHfG5BoUiahNwXB/9+ocxf72O3D6Z2CLCHJe9ZRxBFTKRaBo/xmiIhUYT4SinkvMXnR4uVojjT3LREH7TFcLL7bZknu6LnCUzlhzAhT/PILgsPMfd/57ajCpzshUKkxtc0+M5ArdTc4fDiaa1s6ghwmoRDToc0HgHcgPM1Ng0yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRK+qRtZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59cc765c29so281811166b.3
        for <linux-omap@vger.kernel.org>; Thu, 23 May 2024 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716495907; x=1717100707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gJ/+0iPILoCl4fYJ5JFyaYwZeFs4qxyfRvegHxvQq4I=;
        b=DRK+qRtZxLHWzPilgEI80/kTEzB3CPRF8x1c4e1SCyMYpPQyS3+lEMRrUcoHci8nn7
         dekP7fjCkOiRQLGVdQbOFfAKknXatpWRUITUfay4vZ7B3+fNPS2QLva4c0+EKPp8h/Gm
         AbVXuDAy+5XDOVzdX/CMAcqRc78grw0oMPUht6Zvj788DH4QP1x9Usacjjx8FugbTFg5
         GYIIMeUzGpm9g11/0w6hg0kJjTk3qxtsN+K6dm+toO7/kqcGIbqFT07eUQOFzcZNZX/k
         WNgwd2xBxPnf8Nz68Z4uPd3rFGdYUi2Tu9BDZiGkLtTma7iZ5SQLQmmRnuYZJbsfz9Z2
         VqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716495907; x=1717100707;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJ/+0iPILoCl4fYJ5JFyaYwZeFs4qxyfRvegHxvQq4I=;
        b=TKF/KoX/jAKs2qCNNSENEXf1LD4XOQEx7sArF9KGjKNLKbv9hSaUG5nRvLJXZECLA+
         KTzKM3xBxpbArdvpFhr9hf9JUM9EGiOc5Fqgw5V70NpvZWAh1Yj+m2VqC3Oims1Q+Hr9
         L+BXhVvAXTPXgFRFOJbLlv2MCj6QtMf2ePL6MnbocYZ4TA3CwuK423RI+hHVhicV4719
         P8RbzkDJPJwyM6aGX0xSocV7Ku+GhJfvfpj3W/DnlUqrVwLsM5aixazEapaL09gKXuxR
         D1yGUmAPzFG9gzLGPTkoiCPQL01DsqErAbpKG/W6qgd965OFkZTXlUHxeNanXXGbE4A6
         uMxw==
X-Forwarded-Encrypted: i=1; AJvYcCURVZ/34H3wokoU/oyDkRUtkXc1USd4lTMITbBiW4+V6BONSWOolk2/xCezqnib5nQXhjju7MSFKGXtpA8tgpfn3MPoofgYZcZMcA==
X-Gm-Message-State: AOJu0YzPQsyWDkzrrWj6QfFP1mi/cfqVaN1ToDMkp+q6vT6jeN7MudwH
	QAv5QZLH0Un7dC3LIuLRNOA917loOhE+Tbv8UL4o7Sq3e6s57vSbtFCbsTAVA9w=
X-Google-Smtp-Source: AGHT+IH0kSQVioE6QrkcWMRYqJsVE/G7bhrqp9bayeccrwTPqnCrnAClAN12t1htANyO2JKbYDRBZg==
X-Received: by 2002:a17:906:af8d:b0:a59:ca9c:4de9 with SMTP id a640c23a62f3a-a626537535cmr22590266b.76.1716495907100;
        Thu, 23 May 2024 13:25:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c93bbcesm6162266b.65.2024.05.23.13.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 13:25:06 -0700 (PDT)
Message-ID: <8df0c766-adae-4009-826d-be863e77c609@linaro.org>
Date: Thu, 23 May 2024 22:25:04 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_1/2=5D_ti=3A_omap=3A_MAINTAINERS=3A_move_B?=
 =?UTF-8?Q?eno=C3=AEt_Cousson_to_CREDITS?=
To: Kevin Hilman <khilman@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org,
 Antoine Tenart <atenart@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Benoit Cousson <bcousson@baylibre.com>
References: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
 <7httio2zta.fsf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7httio2zta.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 19:38, Kevin Hilman wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
> 
>> Last email from Benoît Cousson was in 2014 [1], so remove him from
>> maintainers of the TI OMAP platform.  Stale maintainer entries hide
>> information whether subsystem needs help, has a bus-factor or is even
>> orphaned.
>>
>> Benoît Cousson, thank you for TI OMAP contributions and maintenance.
> 
> Not sure why Benoît is not cc'd, so adding him now so he can ack.

Ah, my bad, I am sorry. I used my script which relied on maintainer
entries but the entries got updated.

Apologies.

Best regards,
Krzysztof


