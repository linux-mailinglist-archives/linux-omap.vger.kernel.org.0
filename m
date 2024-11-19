Return-Path: <linux-omap+bounces-2710-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C665C9D27E9
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2024 15:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C651283FF4
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2024 14:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F961CCB47;
	Tue, 19 Nov 2024 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMh8eKdJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547743179;
	Tue, 19 Nov 2024 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732025807; cv=none; b=ZSsIiwUvLgTJjPr0YcMeYwgmmy/lw4Xj5XHwQXzkr9GFk/Nln2+hS2LQfMYXV3UgcqazgAqVud5EvRhu56Thy0TGb13bDl0RSMTIAIY9jQIkBw7PgpYEgpp3nZeFVQqo8b7W7+4QAQdjTdAZhN6qhc8gLRlGqLGs507UdBcwB/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732025807; c=relaxed/simple;
	bh=Pt0e3AOxlsi0tRL6giI32Ge69f9E3kl02JS0+cf9fks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJF/J0tCDS5QL0H8GrMIcXvojABBn2m7SL5li9p7ZGt6fEKGO0DAYp1YqRq3LqP7XBOzdlVLdwlIrPZLjJETiEwuKEP9WyG8FuKfSI3Z0lsxL58MoiwWt3033nih/HaD5B0DkEfHwVhRtRuoHiz/tzyBgckQ6EDYeu7WxXnWsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMh8eKdJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C046AC4CECF;
	Tue, 19 Nov 2024 14:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732025806;
	bh=Pt0e3AOxlsi0tRL6giI32Ge69f9E3kl02JS0+cf9fks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SMh8eKdJvQ71yBqCOIsGs7ZaUSFTZiuesuAWN3fnt8dKBqr67jWXcL5wT3duAtYsz
	 xk/7vJhmxi3dj7fSgQ2xy8sK/BkpgUgBf9JdfwBqhh5+xkGL6YZGe7uvdXbnIGIzo6
	 Oxe5AuVgjaLPSf4TFEPVV4WVexxfa5IsFXvndVqoLCsGY/wib6904EO58o9+6HZMQD
	 GTgg3fnhskqgWinE/H+u2b0ZxT3P7pnv/hIinBE8SiH/L/yPp0Kqmm/+Z5dMAo5pI0
	 SXFQcBiUafBqMbxlKLoMxjHqISZ5WHFBUhiSAcdXF79w4zepMViEG2aBuuxH6b/eQj
	 cw0NELKpVXcuw==
Message-ID: <5d6ccb9f-a8f1-45eb-b54a-cd66e637a2cc@kernel.org>
Date: Tue, 19 Nov 2024 16:16:42 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: omap-usb-tll: check clk_prepare return code
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Karol Przybylski <karprzy7@gmail.com>, aaro.koskinen@iki.fi,
 khilman@baylibre.com, tony@atomide.com, lee@kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
References: <20241113211614.518439-1-karprzy7@gmail.com>
 <486d5734-aa02-4a5e-b2ee-fdbba65179a3@kernel.org>
 <20241119145622.2f1f0342@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241119145622.2f1f0342@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 19/11/2024 15:56, Andreas Kemnade wrote:
> Am Tue, 19 Nov 2024 15:10:23 +0200
> schrieb Roger Quadros <rogerq@kernel.org>:
> 
>> Hi,
>>
>> On 13/11/2024 23:16, Karol Przybylski wrote:
>>> clk_prepare() is called in usbtll_omap_probe to fill clk array.
>>> Return code is not checked, leaving possible error condition unhandled.
>>>
>>> Added variable to hold return value from clk_prepare() and dev_dbg statement
>>> when it's not successful.
>>>
>>> Found in coverity scan, CID 1594680
>>>
>>> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
>>> ---
>>>  drivers/mfd/omap-usb-tll.c | 11 +++++++----
>>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
>>> index 0f7fdb99c809..2e9319ee1b74 100644
>>> --- a/drivers/mfd/omap-usb-tll.c
>>> +++ b/drivers/mfd/omap-usb-tll.c
>>> @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>>>  	struct device				*dev =  &pdev->dev;
>>>  	struct usbtll_omap			*tll;
>>>  	void __iomem				*base;
>>> -	int					i, nch, ver;
>>> +	int					i, nch, ver, err;
>>>  
>>>  	dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
>>>  
>>> @@ -248,10 +248,13 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>>>  					"usb_tll_hs_usb_ch%d_clk", i);
>>>  		tll->ch_clk[i] = clk_get(dev, clkname);
>>>  
>>> -		if (IS_ERR(tll->ch_clk[i]))
>>> +		if (IS_ERR(tll->ch_clk[i])) {
>>>  			dev_dbg(dev, "can't get clock : %s\n", clkname);
> 
> if you want dev_err() later, then why not here?

Because clk is optional. If it is not there then we should not complain.
But if it is there then it needs to be enabled successfully.

> 
>>> -		else
>>> -			clk_prepare(tll->ch_clk[i]);
>>> +		} else {
>>> +			err = clk_prepare(tll->ch_clk[i]);
>>> +			if (err)
>>> +				dev_dbg(dev, "clock prepare error for: %s\n", clkname);  
>>
>> dev_err()?
>>
> So why do you want a different return handling here? (I doubt there is
> any clock having a real prepare() involved here)
> 
> As said in an earlier incarnation of this patch, the real question is
> whether having partial clocks available is a valid operating scenario.
> If yes, then the error should be ignored. If no, then bailing out early
> is a good idea.

In the DT binding, clocks is optional. So if it doesn't exist it is not
an error condition.

> 
> clk_prepare() errors are catched by failing clk_enable() later,
> ch_clk[i] is checked later, too.
> 
>> I think we should return the error in this case.
>> (after unpreparing the prepared clocks and clk_put())
>>
> and pm_runtime_put_sync(dev) 
> 
> Regards,
> Andreas

-- 
cheers,
-roger


