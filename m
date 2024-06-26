Return-Path: <linux-omap+bounces-1606-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE8C919494
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 21:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BA201F23211
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 19:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CFF190691;
	Wed, 26 Jun 2024 19:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcP/paTy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894E314F134;
	Wed, 26 Jun 2024 19:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719428613; cv=none; b=pK4j0flZchCslA6BTMAl+2d/MCmbrbTykHEo/rHzXi2cJjNxXANC37PyqWFFPqcAEXvh7ZLNcMZEe+/7D1iwKe8KjPYp2nQ5pZPgX18CqFYPk8h4+IS/iBh66cZp86y/ZQIWTaEFB1Pq4cUS3KRs2CQ4HDzxPs0geNEJDz6utbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719428613; c=relaxed/simple;
	bh=ByLuiOAIAgAxY4F9odgXxDUOOWJjKpC3pkIhw7lLQcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuMw+Ph7b6W6PLcWS8G5Jj+viQyFVk8nMhVK5RQo2fBF9odAG9uKP+wSzyMXTIfwLbJXgUatIJyZxgeeSd/CVTe1uYh7wkrXT02r37iwg8CGjHTBw5PYFklMH01L6S937mlIZoHX+CsHTB2hajSAodSMrvgrdGOoA1XwpTtyaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcP/paTy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-366f747705dso1768687f8f.2;
        Wed, 26 Jun 2024 12:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719428610; x=1720033410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qV3T6zc76yf/lDtsbOsMSRSVkTqiqk3HNZQgcMN8fks=;
        b=DcP/paTyoQeY5biaeJYvDPtSR/5zGsU3B/crXIDxmGeyEkUG+5EqQBpnqz3MVkhxua
         gDod78wZ0yzio6QRPmtnZL0H82x+N4kBtaL2hDyoaHndaBwMPXqyzGFWhia9gZM11AZu
         I1M77aXs422ETAaMCJvkbi9Sa+9cBP56sQu1mnpZgnGaevvOHb4OqOgyR0imId+rgeZl
         N4RgTIABMp7lZD2bnDMR+S1AjJRyBTXbUvB/KCotDVKntG6WhhJOY2GKcHFU+s6CxGCZ
         bsKmlQ0XZQHGk3sGRKh8oEwUt3ri2nNn/YadfE6vZ/7tGQePIgwNEDjcwUItLe77hotu
         M9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719428610; x=1720033410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qV3T6zc76yf/lDtsbOsMSRSVkTqiqk3HNZQgcMN8fks=;
        b=Vxq8dDhr+LhPjgSCyuB7O9DS4ivB5yMP4smFnNY6fjZ9IPjlJJK67n6txu7hFvp5oX
         shFqfw2qsop4xbpS2Y3rJErL4qIt28Xmd4AX/CdIeTR2HmCPaU0blUqELF6H+oKZvqfq
         ZjlcXFVPBM8ETy8lf9Gggsh7hHajSYKq/AWeaLjoK1TkcaDsFN0DxNCyhZSSYBgTnIjV
         Yv5iqKswOLyGoqJoQ0T/C8L49+rR5kiGjrdjPpL6jw4TbUQEtzmEnUlFVdiwy5mC4MgJ
         FD0C+zAhOJPOz7AUfIT+LDR3XD2SqU2OQY1uVAELWmz+t0JfXRNESG4K5yUWFm1/zibc
         EdKA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8qG9Qjkcpa8HxUNbk12PNZQSTf/FG1UD6KTkXkO+oKRdf/7Ae3I5SpG7ZhBKrjsm3+09bbfczqO/XX8T8Wz4vdUbVJyDtpwFBk7DYXX5OodERruoJNbI1a7HMdrNUhs+SGu0mur9HT6i5YeV4B6ewSNAf9/eymjR6YvNu3cRqZl66rxj2/cxWA==
X-Gm-Message-State: AOJu0YyseCQxUCCZyAiYbcjGlH27Kt/a0pQlC5EU+sbq+0hOUIsRGWXw
	TrkJw3nudncW1bmfKnGtTqv7LUW5bvFI5hP6QojmZOlDEGNpNFTfx66hlzde
X-Google-Smtp-Source: AGHT+IFPCN/kCcs+/5Z1jLHsmmdv+FqBJbQmWI6a9mPwBKyrQl4pUWKSODNnjYZ8LnzlPIwkLVTu1Q==
X-Received: by 2002:adf:ce0c:0:b0:361:d3ec:1031 with SMTP id ffacd0b85a97d-366e94d152emr7243179f8f.31.1719428609545;
        Wed, 26 Jun 2024 12:03:29 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6da6sm16497673f8f.12.2024.06.26.12.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 12:03:29 -0700 (PDT)
Message-ID: <9e654a02-4a6a-47ef-bef6-263866a4941f@gmail.com>
Date: Wed, 26 Jun 2024 21:03:27 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mfd: omap-usb-tll: use struct_size to allocate tll
To: Kees Cook <kees@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
 <20240620-omap-usb-tll-counted_by-v1-2-77797834bb9a@gmail.com>
 <202406261121.2FFD65647@keescook>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202406261121.2FFD65647@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 20:43, Kees Cook wrote:
> On Thu, Jun 20, 2024 at 11:22:34PM +0200, Javier Carrasco wrote:
>> Use the struct_size macro to calculate the size of the tll, which
>> includes a trailing flexible array.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>
>> ---
> 
> I would actually include this entire bit below in the main commit log.
> It's the core of the "why" for this patch.
> 
>> The memory allocation used to be carried out in two steps:
>>
>> tll = devm_kzalloc(dev, sizeof(struct usbtll_omap), GFP_KERNEL);
>> tll->ch_clk = devm_kzalloc(dev, sizeof(struct clk *) * tll->nch,
>>                            GFP_KERNEL);
>>
>> Until commit 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at once")
>> turned that into the current allocation:
>>
>> tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
>>                    GFP_KERNEL);
>>
>> That has surprised me at first glance because I would have expected
>> sizeof(tll->ch_clk[nch]) to return the size of a single pointer, not
>> being equivalent to 'sizeof(struct clk *) * nch'.
>>
>> I might be missing/misunderstanding something here because the commit
>> is not new, and the error should be noticeable. Moreover, I don't have
>> real hardware to test it. Hence why I didn't mark this patch as a fix.
>>
>> I would be pleased to get feedback about this (why it is right as it is,
>> or if that is actually a bug).
> 
> Yeah, I would include:
> 
> Fixes: commit 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at once")
> 
> Because that was a clear mistake. I suspect they were intending to do
> this, which I've seen as a code pattern from time to time:
> 
> 	devm_kzalloc(dev, offsetof(typeof(*tll), ch_clk[nch]));
> 
> But as Jann points out, "nch" is so small:
> 
> drivers/mfd/omap-usb-tll.c:81:#define OMAP_REV2_TLL_CHANNEL_COUNT	2
> drivers/mfd/omap-usb-tll.c:82:#define OMAP_TLL_CHANNEL_COUNT		3
> drivers/mfd/omap-usb-tll.c:220:         nch = OMAP_TLL_CHANNEL_COUNT;
> drivers/mfd/omap-usb-tll.c:224:         nch = OMAP_REV2_TLL_CHANNEL_COUNT;
> 
> struct usbtll_omap {
>         void __iomem    *base;
>         int             nch;            /* num. of channels */
>         struct clk      *ch_clk[];      /* must be the last member */
> };
> 
> That this allocation was asking for 4 + 4 + 4 * 1 (12) instead of:
> 	4 + 4 + 4 * OMAP_TLL_CHANNEL_COUNT (20)
> or
> 	4 + 4 + 4 * OMAP_REV2_TLL_CHANNEL_COUNT (16)
> 
> the latter would have ended up in the same kmalloc bucket (12 would be
> rounded up to 16), but with the ARM alignment issue, the minimum bucket
> size would effectively be tied to CONFIG_ARM_L1_CACHE_SHIFT, which could
> be as low as 5: 32 bytes minimum, so no bug to be had in the real
> world.
> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> 
> -Kees
> 

Thanks for the accurate clarification. That explains indeed why the bug
went unnoticed.
A few more channels or members in the usbtll_omap structure would have
triggered some alarms.

I will address your comments for v2.

>> ---
>>  drivers/mfd/omap-usb-tll.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
>> index a091e5b0f21d..5f25ac514ff2 100644
>> --- a/drivers/mfd/omap-usb-tll.c
>> +++ b/drivers/mfd/omap-usb-tll.c
>> @@ -230,8 +230,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>>  		break;
>>  	}
>>  
>> -	tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
>> -			   GFP_KERNEL);
>> +	tll = devm_kzalloc(dev, struct_size(tll, ch_clk, nch), GFP_KERNEL);
>>  	if (!tll) {
>>  		pm_runtime_put_sync(dev);
>>  		pm_runtime_disable(dev);
>>
>> -- 
>> 2.40.1
>>
> 


