Return-Path: <linux-omap+bounces-776-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA0486E08E
	for <lists+linux-omap@lfdr.de>; Fri,  1 Mar 2024 12:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9ED91F250FF
	for <lists+linux-omap@lfdr.de>; Fri,  1 Mar 2024 11:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC226CDA1;
	Fri,  1 Mar 2024 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mz5VWRuw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12B56A8AD
	for <linux-omap@vger.kernel.org>; Fri,  1 Mar 2024 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709293242; cv=none; b=oT2+PaKlfs6wRTcA1T1TcrD+dfBgRwJtnotnm+orx2jLsZqgRCKCO+fS9Mkp1rpAPY00MnnwdqU+Nsdfg3Pq5tAE3RzEf4pV1aI6llmUOALOvZIA3v8T16iRsS0HxomlHcOcTlbSup8iKxLptz8juvU+P6ia0sogcKUkkRPovVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709293242; c=relaxed/simple;
	bh=Qu6ZmDK96GNsbatrkbOH93BBpWFhFEFCALMrdL1eHqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ng0muzr6+UK5Xh4sqeIP9QafVoRs9BC+wIl+h3fVCYaJS/XQE143v02ZtURy5K18W996Cohok4nFFphoQOqowiG1LQWtbaPRcguoGHgQ4TIWfFYgXZSo8KspQMM/N40Xk6A1fAvPBrvhEDKSJ294DB0PrgK/uPP9zUzaJe+Ufjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mz5VWRuw; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-566df43a1f8so502761a12.0
        for <linux-omap@vger.kernel.org>; Fri, 01 Mar 2024 03:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709293239; x=1709898039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4DA34/5Kvb1127d2yWJOOqxpTefiacI79ML95b5u5E=;
        b=mz5VWRuwiEoHExzvrdWPW521V3y/LqZL6r4/H0xzqKD7zYYKUinqvjpBa8I6tNCe1l
         2OQ5eFweYgdaN5X31yvJQqmqpOZmmw+lyO0qSHdBl31j7jKDSkLnNKMW+nHRRLie764G
         4QV2ARJEof7yqaVJ9AuYx3fbwFo5bVogAMoNSSB1exYFPZQJB7KRiaDSG3DfHyCCtySd
         isRWiYXgzSwa7dLBMeclVvOmvecOA8wnEC8AiGftri9bJtBSYVWxkOLDFDgw9hyHgpLr
         Ql4SBTBdnJDs5Qgn1m3x8Vw+DfTeUHhPd7TU1CD4wWRmKcFswUGVeNe/I4q97Z5ty5Dr
         ZOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709293239; x=1709898039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4DA34/5Kvb1127d2yWJOOqxpTefiacI79ML95b5u5E=;
        b=bM4s2peNqB/BNPG2CcrhV/YMhFEgczwGOpaNyKPi/s1yawg+EqISkzVaTaZyKWE76T
         l636HyVJk3NgnE/AvQqJgDKG0BXFkMyAeUwdCEYsORgzTQO0Kox5h4b9lSBr4KZoO90t
         wUHFntDR9P3bhhS+Jaj/fUXcOLW+5IFbasDRXFnsPReZ8ZwvuNMyXMT0QZfmIQE4JVhb
         +tCA+/FncRZqzWxIPrF+R5SPvERfjdJWLMETxi8PH1p1bR+R4qNlmY3Pb0TukEakaEpv
         Txu/0RYN2F+pahm1WGsMpPYLoe/N9UbFSSErx2zZuYBRFsXiGy54EP3Kgya6PXQs/R4S
         FnDw==
X-Forwarded-Encrypted: i=1; AJvYcCVccFZgHvXTFIEouf6MUTonwj3+wp63A82kU/aWcEYM5ba4DJWsG7BYK9tkSHnFzlfL3KyBsSCFSsA9xRMClsEIv44amM1irotmoQ==
X-Gm-Message-State: AOJu0YyriUfv6EJcc38rJy0wUUB6AFuZOdmBPr6ClNDefDm/c7k8khfm
	v8Uef2V4rWQI9I1+J09alnVsJvkMD5bHMUWq/Qh+X8Xqh4m1Xl/10ei06aK5mFIoVQk6ezeP95Z
	Z
X-Google-Smtp-Source: AGHT+IGHBRcpk1bAIkNMDcmZk1V9eM3Osu4/pZELwwmSrBOeY8UgCvTPnKefM8atiCfFTZiBIQz15w==
X-Received: by 2002:a05:6402:1d18:b0:566:4dc1:522c with SMTP id dg24-20020a0564021d1800b005664dc1522cmr1129700edb.15.1709293239065;
        Fri, 01 Mar 2024 03:40:39 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id el8-20020a056402360800b00566d6e30f1fsm395050edb.31.2024.03.01.03.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 03:40:38 -0800 (PST)
Message-ID: <cfec2fee-ebd8-4865-b307-b64e1bbfa335@linaro.org>
Date: Fri, 1 Mar 2024 12:40:36 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: omap-gpmc: fixup wrongly hierarchy of the
 sub-devices
Content-Language: en-US
To: "Brock.Zheng" <yzheng@techyauld.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <6fftq2zlkpaf7xptyff6ky63cinr76ziyvdbm5jhj2apubr5vf@l4gvbdax3l2e>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6fftq2zlkpaf7xptyff6ky63cinr76ziyvdbm5jhj2apubr5vf@l4gvbdax3l2e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/03/2024 00:52, Brock.Zheng wrote:
> On TI-AM335x，my FPGA under GPMC local-bus can not work on 6.x kernel.
> 
> GPMC <--> FPGA  <--> sub-devices....
> 
> I found that the platform sub-devices is in wrongly organized
> hierarchy.  The grandchildren are now under the GPMC device
> directly, not under it's father(FPGA).
> 
> Signed-off-by: Brock.Zheng <yzheng@techyauld.com>

The dot '.' does not look like part of the name. Are you sure you
transliterated/translated your name correctly?

Also, please provide Fixes tag (see submitting patches document).

Your patch confused my mailer. It looks like HTML, but it seems it is
not. Maybe because of Content-Disposition: inline? Why do you have it?

Best regards,
Krzysztof


