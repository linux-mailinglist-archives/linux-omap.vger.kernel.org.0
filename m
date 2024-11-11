Return-Path: <linux-omap+bounces-2654-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5B39C412A
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 15:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37380280D15
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 14:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8691A01D8;
	Mon, 11 Nov 2024 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBHwPj5p"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2D614EC55;
	Mon, 11 Nov 2024 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731336113; cv=none; b=Uum+Cktut4ivuPCIl8U3JrRKFwQZDVXtGgOurWSthTT3q98LZOLiekU52MHUmW4dNvb8dGW/q9ut7Mf/rboBNPi7jiv9jyHaMcl0A2mxi0RZwwLs6cYbOc5vPwVPX7/ezT0OkUu/H3hj5uxzOnGVOnltn2t/afH3hmQ8SDhRiF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731336113; c=relaxed/simple;
	bh=gQfgqozLAE5g7m9L6Wx0p/96n80+SjfIScZYvj0WqsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uN2/VNYV26e6NJq4bKoi2YicOV7SeV49Ww8eWqCCK/CP8KYAeKd9TpPtzixHaSBVe0rFAJliXhYP7SascD711izASjeCNAbEBRTmlDUVmHf1wp8RWlzmyu0ZU/813ntWRZ3JOKRvpZN3lNhmcdtRDKLo9QL48NEJ/0ynZQX65+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBHwPj5p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9E0C4CECF;
	Mon, 11 Nov 2024 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731336112;
	bh=gQfgqozLAE5g7m9L6Wx0p/96n80+SjfIScZYvj0WqsU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PBHwPj5pU+LKgZ74/GqVQtVbFlbMHmQTmxO/Zgy8+uKQrFPK9g65MVNVpFtKXRURi
	 2XUYux+tbUCyi5DS3cYAZGjz4Rlrsn2Vwwj9+o/sFlubR9lidzpoZt2yIpH9BfUWDJ
	 NcgjMpsMvRSpSgESlg9K9KstOQ50/lq1hycPntwWhM6ODLhZvSG2NAKf/DB3YrlMh4
	 O9LOMr418G8+HZMNedKk+FJPpqQk83aQjNBo8GGUbcPgfs399kGX3PvmwLNu6PpkxS
	 AJjBbzmeXOEajMQuo75yLj0c///X0er86fR4egOOOZId25x+uM0O/JfHiWxwKoGfzq
	 8tp0SZlJcC6Ag==
Message-ID: <cd915c18-7230-4c38-a860-d2a777223147@kernel.org>
Date: Mon, 11 Nov 2024 16:41:47 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: omap-usb-tll: handle clk_prepare return code in
 usbtll_omap_probe
To: Andreas Kemnade <andreas@kemnade.info>, Karol P <karprzy7@gmail.com>
Cc: aaro.koskinen@iki.fi, khilman@baylibre.com, tony@atomide.com,
 lee@kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
References: <20241106223324.479341-1-karprzy7@gmail.com>
 <20241107001507.5a304718@akair>
 <CAKwoAfp6iPN0F_kfNbF8xbpX7+Qh+BS55KgmZ5nis0u00vOFhw@mail.gmail.com>
 <20241110002954.1134398a@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241110002954.1134398a@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/11/2024 01:29, Andreas Kemnade wrote:
> Am Thu, 7 Nov 2024 12:12:52 +0100
> schrieb Karol P <karprzy7@gmail.com>:
> 
>> On Thu, 7 Nov 2024 at 00:15, Andreas Kemnade <andreas@kemnade.info> wrote:
>>>
>>> Am Wed,  6 Nov 2024 23:33:24 +0100
>>> schrieb Karol Przybylski <karprzy7@gmail.com>:
>>>  
>>>> clk_prepare() is called in usbtll_omap_probe to fill clk array.
>>>> Return code is not checked, leaving possible error condition unhandled.
>>>>
>>>> Added variable to hold return value from clk_prepare() and return statement
>>>> when it's not successful.
>>>>
>>>> Found in coverity scan, CID 1594680
>>>>
>>>> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
>>>> ---
>>>>  drivers/mfd/omap-usb-tll.c | 8 ++++++--
>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
>>>> index 0f7fdb99c809..28446b082c85 100644
>>>> --- a/drivers/mfd/omap-usb-tll.c
>>>> +++ b/drivers/mfd/omap-usb-tll.c
>>>> @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>>>>       struct device                           *dev =  &pdev->dev;
>>>>       struct usbtll_omap                      *tll;
>>>>       void __iomem                            *base;
>>>> -     int                                     i, nch, ver;
>>>> +     int                                     i, nch, ver, err;
>>>>
>>>>       dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
>>>>
>>>> @@ -251,7 +251,11 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>>>>               if (IS_ERR(tll->ch_clk[i]))
>>>>                       dev_dbg(dev, "can't get clock : %s\n", clkname);  
>>>
>>> if you add more intensive error checking, then why is this error
>>> ignored and not returned?  
>>
>> Thank you for the feedback. It does seem that elevated error checking
>> is not the way
>> to go in this case. 
> 
> As far as I can see everything checks ch_clk[i] for validity before
> usage. Also clk_enable() called later is checked which would catch
> clk_prepare() failures, if there were even possible here.
> 
> So the only question which I am not 100% sure about is whether having
> ch_clk sparsly populated is normal operation. If that is the case, then
> more error checking is not useful. If not, then it might let us better
> sleep. As said as far as I can see errors are catched later.
> 
> @Roger: what is your opintion towards this?

I don't see usb_tll_hs_usb_ch?_clk in any of the OMAP device trees.
Could it be that they are optional?
If so then we could convert it to devm_clk_get_optional()?

While at that, maybe the device tree binding could also be updated and
converted to yaml.

> 
> BTW: If you do this kind of work, you could also use W=1 or
> CONFIG_WERROR during compiling to catch easy things. At least I see new
> compile warnings with your patch. 
> 
> Regards,
> Andreas

-- 
cheers,
-roger

