Return-Path: <linux-omap+bounces-1596-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2C918190
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 15:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48F60282205
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 13:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FF81802D9;
	Wed, 26 Jun 2024 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MPIdSDzE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F64E79F0
	for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406934; cv=none; b=pi6d9ONnpOCgqbG58pARB24ACeQqKlKwe22m8KotbOkmGjfjmApeRL1srppItyG3lt/JNWXfoBcxghlSJJ7vAz27UXgBEeJZmcV6NgoaGufzgMJL6mTFk0D3SK6gGadhdAf6aLNJC/LnMG6LXteprjoIv0P4fA2d71NJ6EPvm3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406934; c=relaxed/simple;
	bh=y6R3I5DjN5XQ67ioInQFM05Kgt6qzC2kQ5CZHpakAS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3BssugV0Pohnjnt668ReKk6CGjzS47fY1uNyr0xufRznuKDAHHDjIQ98xLam59LKmDHMsn9YzpPx0ra1vY4oarMQzx6B6TCvJMvOUPuPNb9k4VExBQS2Gat4uSfoUDEyLi6YFvvL06b2oiwIi+XO27NMNx+sES9xir0lsLtUjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MPIdSDzE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so291069a12.1
        for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719406932; x=1720011732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=plqFlZCw6ZIQQKZWZwUQhNl39GkiZL+iHyxu4ozy+eY=;
        b=MPIdSDzEcms7pOhr3lk+TBUZiWzqDUq+i3A9QZWgFvJ/21By3IQD3J6JsBJsg9fTMy
         7jWY01ceWeqm2XyVnuS4Wj/s50aw3gaqMWzwogeZ+oTbQmgm8/KPhnHzOL1jfQP+oDhr
         7DjFD5vhkDiXWX0bN/nTaxHZ1j+yVaNH8/NbOseKrN82btC8IzxTDpZGLAI2ocsxBVoT
         zV9U65szrcs/x5sn6kwVn29EBpwfWWDTLYGoCi9zbhyBrZvr4h7tx2nQaNZiy98iikqR
         +4dQLuSxzwKEGIn2Lp0vnXboZIbiFzXQdoHi9ZzU6mUDKZi+zQXyg0JIxvk52+ad75j/
         3VGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719406932; x=1720011732;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plqFlZCw6ZIQQKZWZwUQhNl39GkiZL+iHyxu4ozy+eY=;
        b=VwfPyo2tCTiHDiSWyERdrPJ0c/VYcpJagrd8UMhEzQ970ZoUu0OPfqfjU82e+hm/j7
         UFUnPi9MFr/Mze8Hbnwgh9inZi1ylg90iWgt2fwOLhrmFx3Nusj5I0WVL7g0xaNe/rdk
         sAXqRk8oXb4qQWEb9Rxyc6/pLBeRRGjteDovXMsuhsJumhkvGICkFDCuKapeeuQvR8bh
         9CnqCxiPEHsL6w8a76d5tnSLbfm5uAYD1WNNZerrLV8mt+7CMkjJgmCaZ3TFtVXl/EHg
         cBoKpQhxyWxun1PIxaAmMVszn1XvapEESsnnLIQko5jCWRq6ZqmtDvYXs0WwKJAqbMhu
         aTQA==
X-Forwarded-Encrypted: i=1; AJvYcCVdcQc8RZQJZOirwwLJbPQqoPuVaHITEEY67ABog/QvjGPydJsuQTEBJCukwsybWQrZPLQ4uv4ajErvL6Kb+hUlOlx7cSaszcdVFw==
X-Gm-Message-State: AOJu0Yws4ngrg5svGcSeCb80xIKkv+G4XZYo/4f+hktVbzFEfn9FuM5y
	Y+4YNPvBU4OIxJrfAIftVcpK0vptG7K8JRxWhQU4H7c3YIKZltuEqUN4NOm+Nnc=
X-Google-Smtp-Source: AGHT+IFUi11eBmbujZ9nBhsouTzP+SacRvRY22s9LCNDckI6MJfoPTxAsQc703B9oFnmCNzFeQFgcg==
X-Received: by 2002:a50:d51c:0:b0:57c:a49f:ddd4 with SMTP id 4fb4d7f45d1cf-57d4bd75061mr6094525a12.17.1719406931671;
        Wed, 26 Jun 2024 06:02:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d305351dbsm7229006a12.77.2024.06.26.06.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:02:11 -0700 (PDT)
Message-ID: <b1f07743-a2a7-4984-b168-0f08e87ce0ec@linaro.org>
Date: Wed, 26 Jun 2024 15:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: ti: align panel timings node name with dtschema
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20240509104813.216655-1-krzysztof.kozlowski@linaro.org>
 <171940115812.32431.4234002524799635130.b4-ty@linaro.org>
 <CAMRc=Mc8ET2GneRT_PoGvffe+c5u13zAYsRr3u5P+aRzQv4CAQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMRc=Mc8ET2GneRT_PoGvffe+c5u13zAYsRr3u5P+aRzQv4CAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2024 13:47, Bartosz Golaszewski wrote:
> On Wed, Jun 26, 2024 at 1:26 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>>
>> On Thu, 09 May 2024 12:48:13 +0200, Krzysztof Kozlowski wrote:
>>> DT schema expects panel timings node to follow certain pattern,
>>> dtbs_check warnings:
>>>
>>>   am335x-pdu001.dtb: display-timings: '240x320p16' does not match any of the regexes: '^timing', 'pinctrl-[0-9]+'
>>>
>>> Linux drivers do not care about node name, so this should not have
>>> effect on Linux.
>>>
>>> [...]
>>
>> 1.5 months on the lists, but maybe I combined too many separate TI maintainers,
>> so no one feels responsible... then I guess I will take it.
>>
> 
> Yeah next time you should probably at least split omap and davinci
> bits into separate patches. Otherwise I think Tony thought I'd pick it
> up and vice versa.

I guess after you acked it, Tony would pick it up.

Anyway, please let me know if I should drop the patch / resend / split etc.

Best regards,
Krzysztof


