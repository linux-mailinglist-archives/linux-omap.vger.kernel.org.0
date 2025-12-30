Return-Path: <linux-omap+bounces-5298-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D425CEA608
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 18:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CB7F30222D7
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 17:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0C632C933;
	Tue, 30 Dec 2025 17:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiuWUDig"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF89632C301
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117578; cv=none; b=ov/LGF69CDlMX4U6ckZA1gG1KK/JCTQ+GD8E/YAFI//Rp6GmBlHoqxOeP84NVf3O+zHYKO2wyGrseXiw0r69BjgLkd+obiingMS6kVzi23aS0Zr8i2tXWYjZ2hy6e9uL9lkqXRwmx7pcHToV10nElU3fpgjsQk4wp+9Emj6jNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117578; c=relaxed/simple;
	bh=Svf6CW8WgH/scy3ZDCbvYCOLQqor3XFA6TUVq8BoF9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sUifnKRE1GOYqKMOJacQQETLv7rjoLaltu7OqSTQYuvrpZlumwbM3D7n+P3GuREbqhKvl69V4q5frc/jA69699yFHLDBD24I+X4HouMEIgFRKVv5SvH+IGSJTLJV7TaNt3LdPTyhS1ugTPm8b+sq9Zv03BvTQaCe5WKEx7DJyTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiuWUDig; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a102494058so54850205ad.0
        for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 09:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767117576; x=1767722376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CHIgKSfibsVDyynvS5htdSQz4K+hlBg8dyDuvjuAZc=;
        b=kiuWUDigxcFlkIm2xDOE4hG5wpJOikr/wd5N6cZyV75F4dqbfdkEYCYTNvLrSiaDyi
         LN0UmNq7QmtZL1/oah5lb7To2fSjZvYgyWa3xoBRv3NKX9nXFyylHEv/SfZ71hkYeiH/
         VndH0SETSft14zOZWExmOoHSTc50XFIh0AriiSXWxdEHKeIiSRGCzRI0EomhFWwITZjO
         bD7HGjiFspOEpVJKYTz/tv+eKXpiXV6J7VbG2fHIozcVVulu4cYt9EqJk4JQcxoakh3c
         q7Re4xibrYFmgFKLV6HWl9Bbimidrvayhud6WPk5R7zrF/gaoPP8hBNNy9BzekBSRPOx
         jzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767117576; x=1767722376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CHIgKSfibsVDyynvS5htdSQz4K+hlBg8dyDuvjuAZc=;
        b=L65qBti3awAtpmS5eKKZuTJ3yVT8SKFkojTweoR1IGmmHh4laPSpbPSUhVPLAs8bzC
         PW/U86LSsAeBWfmyoJfarEMsRHvuo4yYhhxZb803TEPipRDZo/r7l76cT77ZWO1A4JOW
         amXRAvmzwouAuSETI+yMgpVhX61lU36cof4MNlyG/Aec3QBv/sqdF0F8N5ZVe0IPa+Ev
         lrHSbkNFhdmXYd0sUd5LTg+74wWzE9pJxmAJx8pxzX0BRM8tpzDS3Z+Jaf5u0Dhx+Xeu
         dc1xuWBdUOCRGexsVHCPI71moJUrq/w5URNlm3Zh4tVC2cdOqPnvU+EJxY6gH9PPMib4
         P4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfy/uepXfDG+ManWP41TKBhdSMjyQKGlvtHbvmSs0POFxAv2IoDF/tb/J0cISku+gW+MqL1j+dQWM7@vger.kernel.org
X-Gm-Message-State: AOJu0YwtgHyIedaxNrb5TfdcUy5PELEAoggD7T8NYoTzcpvMIsgjoYHm
	vAXBs8kNYYb+9JI+v2U/AOT6Wg5d4fudKJTE+csbymj3vsP1IX9QpTV3
X-Gm-Gg: AY/fxX4f2uojhz43/sGGvIBQzkRiQLmRlgGAcQoUJTUaWTJuO2F08s/XJUtfavvahiX
	IsuE77SAQSXzM5tW9OJpZv4xM6/QA0OgIumVSfMlZOpZe6EKnANGaVjPxG1w7T2tpO1/c/jp/ju
	DGCXHzcwrrFMr1QNg265eGJBFMiRyfcWMzhjhO14Owvjt9myB68AW2WY3Vgh67JxAAinB2e6PIn
	UCSFm3rkp0Frzk8Ud2grbJSnvlh7p9o3GmIRm0ig3E3reDFFDkHFh9vdGvwCMqxv8AZBscrlf1E
	Wg2wlUIVzfm+QNXxF7U0M/vmvvg2wKYo6mP4Q+6fg9DJ6lrtgHy6ekdB3U/brA1Wl3UAnu7CTIm
	uGcX5xnprLUcsnKi0cmHUwPx911gWl+B+97MAf/EovyGgNOm89oJjjYjVmlLVe9pottE4I2UMKG
	VHhVqIFe/iy26STql7d0nYro2uCEBbXUWxSNx4CuwPMDiAIx4raOU2TsKyWR1y
X-Google-Smtp-Source: AGHT+IHFngs68Viy0QIud4OyKUMML0W7Abh6BiK0CuBqkEfCHrIFWmwGVVieu+bTWVJ/P4u+tamC4Q==
X-Received: by 2002:a17:903:4b30:b0:2a0:de67:9704 with SMTP id d9443c01a7336-2a2f0d2daa8mr301443375ad.19.1767117576143;
        Tue, 30 Dec 2025 09:59:36 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:d742:b62c:dcc9:47cd? ([2601:1c0:5780:9200:d742:b62c:dcc9:47cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb48sm308258165ad.64.2025.12.30.09.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 09:59:35 -0800 (PST)
Message-ID: <7ded1cc9-71bb-4ad3-8804-477b4317a6b3@gmail.com>
Date: Tue, 30 Dec 2025 09:59:35 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <aVO4pslXIvnc00J3@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVO4pslXIvnc00J3@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/30/25 03:33, Andy Shevchenko wrote:
> On Mon, Dec 29, 2025 at 09:28:18PM -0800, Chintan Patel wrote:
>> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
>> it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
>> remove hard FB_DEVICE dependencies.
>>
>> The series introduces a small helper, dev_of_fbinfo(), which returns
>> NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
>> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
>> full compile-time syntax checking.
> 
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>> Changes in v3:
>> - Use PTR_IF() to conditionally include overlay_sysfs_group in
>>    overlay_sysfs_groups
>> - Decouple variable definition and assignment in fbtft_sysfs_init/exit
> 
> Any particular reasons you ignored my tag from v2?
> 
Ah.. This is typo. I see what happened now. Looks like my script picked 
wrong or old patches instead of new updated one. Should I send v4 or v4 
is fine?

