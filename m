Return-Path: <linux-omap+bounces-1592-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AEC917FC3
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 13:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48EBF1C2372D
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 11:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6C117F374;
	Wed, 26 Jun 2024 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r4S0bUNZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE017F383
	for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719401625; cv=none; b=vBTWMkH5+rR4els/UYnPcYSZm+oSnVRngoxkfDEfn3iPasiNfkCYZlxwKqLvdKnNZY7eULVtiIdLSkNe7iWz53+YLqa9zmf2ffs4KackjiL9q+TRt48KuRgfddcR5et3YoYojlRyVp0h2aNsW1ip6rmPqluIzMUhZCYX5UCfDIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719401625; c=relaxed/simple;
	bh=DqnB6sU5Qi4z6Wj9U48mHIJLdjJeLbB8ULLvRMw8ruE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDYBsdhtqJTiMgFW0Y/1aj5jKFDJiXp6kh4HpAsSxy8mxcuPqgau1Sd5ESFMLC+gi7Kmelr224ZiXCHvci+XgqFtp+j2JDbdPGXxrTfCfO1ksMRxE18+4m6RzFD95Hlb7dOzxC57xOxztzBD4lyga++00DXW2R2B1kIOsoOv64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r4S0bUNZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-424acfff613so8463625e9.0
        for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 04:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719401621; x=1720006421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WfM5vF2q2MR6HvddQqYoHOXV5lpo1oUCoQ3ivJAVNak=;
        b=r4S0bUNZo+oSPbipjM/eEtHS0Bp5C96WR5Btvfb0Wd11Uok0fRTcgB3AVy3Ujj5NSE
         zbp6NKKp88PNBptUNRHNun9YRKCJ5di/vigsg+mkJNgFjlXq7oWFrFDDb6RR1xJsIIlC
         nhq1RAvM7Qgbm7vBzpb43t1eQ08KfyrI144qVPZnwNcR9VozXOEutCZFRMG7wG8CBf2+
         AqRpMa80Uec7kqTrAN+DNwW/jEv/eY+c7ToXR87RLg4lFcwHtscT/2+XGfcpRmunxFgR
         oFgKSNqwACNAJVhUNYnE3vsoWkdH1YMjjDzluR+pZcbZLDUYlyxIl2+R3Ok/cB+ygtPA
         4b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719401621; x=1720006421;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfM5vF2q2MR6HvddQqYoHOXV5lpo1oUCoQ3ivJAVNak=;
        b=B94eZVu8ciKOZNZSexf9Z9LyGiBB4cZHuDmDy9rKAYJg4lUDSvj0g2OQX9ZHM0HQCT
         diHF4bg0x2n++IjxT/aCDv1KDD/DiHYVRYjnGHmu3fCI7rx1fMl7vUw0Rs53ihjMPfW4
         HfOkqCtCCyDugp3UDp0MbBdTUrhTKbLRa5KFiS4fCYd8gromqAhO+IfJJVU3qd9FixQr
         fuHhHbNZjB2QHpSRB02/p71rPVO7tnYw3h8exvWp0WOvpYwC4kdqBB9tX6I/K7b103vq
         aflJcIFqkoKBYHUdKgPYy7UiRnUpN1PMCwcE3sFJ/6iF1tPGAAp6qJHuShNtz5ZXnwEi
         PSjA==
X-Forwarded-Encrypted: i=1; AJvYcCVbhZ1akUdRyJMMBuOs45Y0j72m/gQo62I/aDottcABjFxdd5d/RNvrPvO2xlyihX4vHEH28N9rdFyFMbAg34WX1gQYb439bb0dJg==
X-Gm-Message-State: AOJu0YxZ69jqfGQ1hueGB5VirDbwvxOuZcgyCKUw/0QpZUyZ7PEmOxiW
	Mw+pQs6sNhHBVe8r6kYZjzY7BBuOi82P6A5m3/K5SMiDdqUSgt+8L9soY3YsnrE=
X-Google-Smtp-Source: AGHT+IGU/c4KmvHbmTt+xqBpSMU/a6+QgxBEEFYmrav+vB8M9PjCo0QTSGiOW0vpuLYp1/5LIeoDIQ==
X-Received: by 2002:a05:600c:2e49:b0:424:a48d:9768 with SMTP id 5b1f17b1804b1-424a48d9843mr31340375e9.39.1719401621593;
        Wed, 26 Jun 2024 04:33:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8246b1dsm23255265e9.6.2024.06.26.04.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 04:33:41 -0700 (PDT)
Message-ID: <dcd6afee-b17d-4633-af7a-4a5dbf68be94@linaro.org>
Date: Wed, 26 Jun 2024 13:33:39 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: omap am5729-beagleboneai: drop unneeded
 ti,enable-id-detection
To: Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20240615174904.39012-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240615174904.39012-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/06/2024 19:49, Krzysztof Kozlowski wrote:
> There is a ti,enable-id-detection property in the Extcon Palmas
> (extcon-palmas), but not in the Extcon USB GPIO binding and driver.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406152004.F2fNnorG-lkp@intel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Tony,

Do you still pick up patches for OMAP? Any comments on this?

Best regards,
Krzysztof


