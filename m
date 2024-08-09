Return-Path: <linux-omap+bounces-1899-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 581AA94D2F5
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 17:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E7D51F21F8B
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 15:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C31197A9E;
	Fri,  9 Aug 2024 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OuT1iyRv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1890F197A7A;
	Fri,  9 Aug 2024 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723216181; cv=none; b=UxKwahAiDlz7jsl2s7Ssg9KuJp+4YBjP9gam8VqBuVBDV2f/s1Fl4Lumbys6burubFMrzAPIk+sqonlunLi7WLc/b1yQk7ogN9IAN4MvqkhiEAAAdirhhCt09nrONitOVeeTGYUw+XGq4+ki0iVSyrxE7/P607ykYxcO6MlDWqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723216181; c=relaxed/simple;
	bh=OuHZ5Ys/4q21gD7TrBJvv6OUB8KQ14N9UVhninn1ulM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTcoorqCrwvzp+HCpciSH2+5oRdsMhH/OfUO42yipL+a7NbiLuwhbjCY8Jry3p96qApz4YrGqwGMz7e6Bidu9VG2GwVjkuj5/hyb17pUMkPygCm2ixwSHn39gEDNZfk8VHu+8tSCNJlQMEcfi2RYawJ54NPaZKiA/INNkHjGK9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=OuT1iyRv; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id cRFBsyKbPIDadcRFBsE0us; Fri, 09 Aug 2024 17:09:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723216170;
	bh=Za0QZIRDiSzOXQG6QHcalUfH/TEPCTSjMejkNNfjFls=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OuT1iyRvtWRj5GvKLCgK2vzSaKajOO0qmnMYjqU89Rcu0pwJP6moSu5o5FB4zUVEM
	 2FbbAa8lt856bu765fHwjRLxld8QT6w5aoPpBmK/325GjdGeYj3r8E23kHiBDML7d2
	 k8esYkbADuxng1/OrnaWmu1eDDLqUBndXOorbZvhvOrwBmGzaTffRuHSaC87aygliH
	 iq6RYYBRdwifsk9Iw08bmturP0gMVU8pRXh2sVJSczSTB6yOwflmttcJNVJi3QKGxn
	 BamA5rjxdh7jHv/JExkYiq4oeYYCwJSoV0avzWGFDq4QCbCA6sPgWeyEy0smkPzlvY
	 8xmReqbkEL8Dg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 09 Aug 2024 17:09:30 +0200
X-ME-IP: 90.11.132.44
Message-ID: <7b65dbd8-1129-4fcc-97ba-43400fc98e31@wanadoo.fr>
Date: Fri, 9 Aug 2024 17:09:28 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
 <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/08/2024 à 16:42, Dan Carpenter a écrit :
> On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
>> Use sysfs_emit_at() instead of snprintf() + custom logic.
>> Using sysfs_emit_at() is much more simple.
>>
>> Also, sysfs_emit() is already used in this function, so using
>> sysfs_emit_at() is more consistent.
>>
>> Also simplify the logic:
>>    - always add a space after an entry
>>    - change the last space into a '\n'
>>
>> Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
>> can not be reached.
>> So better keep everything simple (and correct).
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
>> index 71d2e015960c..fc975615d5c9 100644
>> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
>> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
>> @@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
>>   		char *buf)
>>   {
>>   	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>> -	int len;
>> +	int len = 0;
>>   	int i;
>>   
>>   	if (!ddata->has_cabc)
>>   		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
>>   
>> -	for (i = 0, len = 0;
>> -	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
>> -		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
>> -			i ? " " : "", cabc_modes[i],
>> -			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
>> +	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
>> +		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
>> +
>> +	/* Remove the trailing space */
>> +	if (len)
>> +		buf[len - 1] = '\n';
> 
> I'm uncomfortable with this line.  It assumes we don't overflow PAGE_SIZE where
> the original code was careful about checking.  Probably easiest to do what the
> original code did and say:
> 

Hi Dan,

I don't follow you. AFAIK, it does not assume anything.

Thanks to sysfs_emit_at(), len can only be in [0..PAGE_SIZE-1] because 
the trailing \0 is not counted.

So, as len != 0, len-1 is in [0..PAGE_SIZE-2].

How do you think an overflow could happen?


Also, all this code does is buildind:
	"off, ui, still-image, moving-image\n"

So in any case, an overflow is impossible, and really unlikely in the 
future as well.


 From my PoV, my proposed patch is both much more readable and still 
correct in all cases.

CJ

> 	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> 		len += sysfs_emit_at(buf, len, "%s%s", cabc_modes[i],
> 				     i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
> 
> regards,
> dan carpenter
> 
> 
> 
> 


