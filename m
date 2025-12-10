Return-Path: <linux-omap+bounces-5149-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D960FCB1E7E
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 05:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D39C9306955B
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 04:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A93030276D;
	Wed, 10 Dec 2025 04:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3yDQEYn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4181A238C
	for <linux-omap@vger.kernel.org>; Wed, 10 Dec 2025 04:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765340804; cv=none; b=sp+h6VcuP7svv7Hgt9bKAhsJH9wE5PB5RDPCBrvEmeGmNDsUEOqbO4oD4Q/5ClaIRpcbz7pLv9gSp9jJXIErCEZofdQ4XbSP7b9SCH7iBqtGRQDqe5BMLYUIv58I5Ry9t6KiStOyCZSyESgDUPKQhrKjjXhvyS7OgcLTw+ZI/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765340804; c=relaxed/simple;
	bh=sj+TFlLPqZ+s1w+yvXLn+DhvC+eXwCs89D5IuNhjqs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCpApeODq1Nnop24z4oGI/mBrhaFY3eVnw+r2+A27jhaD8W0Hq6AxaPa+zDlDCTrXB+u3rh1aXKrTKRFagCQyEInMerxQRzQOpnvEaO+S8jsRK9vQd4J0FXeaBcAwmGJUU6y4g6rcVacj4yuSJLCq0yHjq+nxRmOojpsdQzuFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3yDQEYn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343806688c5so5189471a91.0
        for <linux-omap@vger.kernel.org>; Tue, 09 Dec 2025 20:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765340803; x=1765945603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tk/No+Mm3I+u10bIGMU4QecHhYZtSqoq4vJuDZr7ifY=;
        b=K3yDQEYnu9nAEUfOoQ4xYesBmvWT7Gex4NgUgyG4vwMxJ7RiJi6qwyu8NMZ8Ri0H2s
         HDUpyEeLvGryDc2mQg6/CSAn9xJGAhcoqkm6dobD9/tWS++tMyo8DJ1XayEG094Bllel
         dJxxwO+U/qxhtNQlTGor7JKaYXspfqDAo4CZ1ppVn98om8DIaENX5Z78bbcGCTTIjq3H
         Mr7dD17pnnuyZba8i1fUFDICYl4tbX4oI9MXWPAOKR0b+I0K06Stw8vcwnJKxHMtTHFA
         SIMFZ4ub0wan1+dT+6i/keL9+MGReqAug1NC7T4O7ypZxGwS+asikd9rH+4q3c8WxruH
         Vnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765340803; x=1765945603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tk/No+Mm3I+u10bIGMU4QecHhYZtSqoq4vJuDZr7ifY=;
        b=FKJ3lEQ3VroNQRWmCj9B3+agIU4E34D2CKWL0lG0QJf1UBDR08TACt5dcAZguzX1xe
         QoQnhyULpaSmGRkP3x3LwGJ9QC3+GNzkOi+JVcVnz4FuFUxGuL+6AYdSiz2ZS/zXBl+M
         OoruQ7zXKcZvbo7O0DfldnVi8EhsBLW500c54/jJnos39E7cUJ4fb3Dfkdq7CHFcGIQU
         ScMod6A6vvbYg3fxPYlDmD4EnMQdOBK4nfIKOPW0Oonf16VXNUyOZ4PzF5jDsdyC8xDN
         gWGjogKI2GZynTIYdvGKYizGpw1V4O1q+Eb/83r49f3F05fHVLBjkGQPYEnBM069ZyzN
         Xq3w==
X-Forwarded-Encrypted: i=1; AJvYcCWwbNf/XKLcGxG6qg0HPUcvy4MfGY4xAXSD+gcFjJmsfIcfAfs/A8CUpkXM8z8saJCg/Zm9czAamdIK@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWclyb5/gErg4V7RSWpZBZSmOjeYo1QbOTeta9hf9HShBhIXn
	+TYu/9B0a4dXqubKPf6pG87qwuoTE4552zg49FNdyv37OfCi2mQQl6ZIxjQ7/HLg
X-Gm-Gg: AY/fxX79QycZ7YfpdU8ZIAkS3+elrJJb3oIzK2/bv7AoXb5FqMClUPr6VdOyey7SULQ
	eFqhTqCmdzocQH1p+VbRwjmRVrUx80UqKUCpbtC46C/UpPTHs4wUGRNn/lmMLEXqD/grc6RUCbJ
	lADn8Ph/BSb7OIwGzjM25/+mo80K8ZwjWYplBOYaxEc5s6klJ0aPGtWsPWL/yi/msBkMRvr3Som
	4JE2ahVkoQNKMiZD2V1GZDI/mdgXoybo2QKwEw2uP12mLYC9LYnAn1uxfM2CXH+wJa7qguXsjKl
	6FMdQhgl46oKCP7t8AQ8Z9JdKAA7LHY47cY/MxJgQW0FMRLlUnbpCDNo9OXTu3qESe8cVicFMia
	hAfNIKh+GLADYQIMffxBw5SRvC81DCXoRTGtK7TEKI3nbViCRrIpVE2+Cr+I84vafh+e19J/nEf
	UWH0aLbmIMMLrBa43G+qo8fq2wJnvl72Y6yw9818HP9CdTO/gYDL2+tSTISpViA7N9ih93/DI=
X-Google-Smtp-Source: AGHT+IEkCPOkyg0imXvpe+yjarzV/1sk/8YYfqF82dhTlKcX5BeBSLcY5y7rsJgrq/q2KnhrIhD0uw==
X-Received: by 2002:a17:90b:5252:b0:343:684c:f8ad with SMTP id 98e67ed59e1d1-34a72808b72mr1162287a91.4.1765340802654;
        Tue, 09 Dec 2025 20:26:42 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:b90d:2938:bd7a:289f? ([2601:1c0:5780:9200:b90d:2938:bd7a:289f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a70926cd8sm971106a91.12.2025.12.09.20.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 20:26:42 -0800 (PST)
Message-ID: <d71e2795-f918-482b-af0e-18376f8ca835@gmail.com>
Date: Tue, 9 Dec 2025 20:26:41 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, gregkh@linuxfoundation.org
References: <20251209042744.7875-1-chintanlike@gmail.com>
 <19e8a1b0-75e3-4c8d-911a-15fd70f60bea@suse.de>
 <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
 <CAHp75Vds8GP+daMe9WcEbOaNT91kMHUjidzGUN-1_kVDuWBtLw@mail.gmail.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <CAHp75Vds8GP+daMe9WcEbOaNT91kMHUjidzGUN-1_kVDuWBtLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/9/25 06:25, Andy Shevchenko wrote:
> On Tue, Dec 9, 2025 at 10:23 AM Helge Deller <deller@gmx.de> wrote:
>> On 12/9/25 08:27, Thomas Zimmermann wrote:
> 
> ...
> 
>> This whole series adds a whole lot of ifdef'ery, which I think is the
>> worst approach. It makes the code less readable and leads to two code
>> paths, which may trigger different build errors depending on the config.
>>
>> I'm sure it must be possible to do the same without adding more #ifdefs,
>> e.g. by introducing a function like   dev_of_fbinfo(fbinfo)  which
>> simply returns NULL for the FB_DEVICE=n case.  Then, that value can be tested
>> like
>>          if (dev_of_fbinfo(fbinfo))
>>                  {...do-the-things...}
>> For the FB_DEVICE=n case this will then be optimized out by the compiler,
>> while you still have full compiler syntax checking.
>>
>> Thoughts?
> 
> I second you. I am also not a fan of ifdeffery when it can be avoided.
> 

Thank you for the review! Will do the change.

