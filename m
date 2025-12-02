Return-Path: <linux-omap+bounces-5104-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E1C9B746
	for <lists+linux-omap@lfdr.de>; Tue, 02 Dec 2025 13:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB7A3A7747
	for <lists+linux-omap@lfdr.de>; Tue,  2 Dec 2025 12:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F543126C4;
	Tue,  2 Dec 2025 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3xhzhvZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376CE30F92B;
	Tue,  2 Dec 2025 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764677957; cv=none; b=s50fwo9Ms5TcDNs/3TDkPMay45fFC24zVY+PvO0ZTC3eK/ulMcr+0belX/k/ffOirrOD+N5Gc+H1YBOzZCoOVYCIkRWmzScVv5ecmjKx41qr0fVMsvE42mC+rrfuiZVgOY5y5oy8S/fmKQzPAUGVyUCL/m0zbl5njekmeHrE8SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764677957; c=relaxed/simple;
	bh=YBi3YUkqodTsYf+i5t2h0346A9zjvPssn3oYGLC9Xxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tX+9PCO0s0+dHTlF0US52U3u/+yboCoeQFioS793xkjY/QREx+YQbTTDUehNkqHocRMXwqgD8ppnOSUl0b4TaHGVglmkDAC2u0hc7X5CjwlcJznXxSQPBjHFdiIti8bP+dSGeg4I8MW1gS7NjOf3gyRomrPy73Rh4pZTKeVdARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3xhzhvZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D973C4CEF1;
	Tue,  2 Dec 2025 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764677956;
	bh=YBi3YUkqodTsYf+i5t2h0346A9zjvPssn3oYGLC9Xxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s3xhzhvZThePAP2iULk+4TOh2DkzpUoHE5H2hpOm+eqrwFaKEu5TggzlSQ6Tt/aUD
	 fuZqLED5Bb02IroktiJ12VBI7lp54lerxO0R8aNMx8ngRLtt/k1tzGgmE1ebNzydW+
	 UyoOEdfL1GiA/Xar89EmVHCwZmdFqog+EGDuaowhuCMOOHSui/KDNiSOLG/xZaSNu6
	 fgSirYvwgfyusXroeMY4JaSd5j/s8UbENQBFoP7cw0O+END838/uhX4U6ieimaDXdy
	 vu3Dwl6AmNd3j6NOuc/wQimsGfYM0D/cIORIXw1OemuECwpuC79WsRPZHLkDT8BIti
	 KBX5srmw1bvzA==
Message-ID: <c6ae49de-d1e3-4f9c-b9d0-95cf7a9d9815@kernel.org>
Date: Tue, 2 Dec 2025 13:19:08 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead of
 ti,tilcdc,panel driver
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miguel Gazquez <miguel.gazquez@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
 <96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
 <3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
 <20251202104244.59a9e83d@kmaincent-XPS-13-7390>
 <d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
 <20251202114416.09624a4b@kmaincent-XPS-13-7390>
 <94e254fa-289d-41ed-909f-1742cfbb2690@kernel.org>
 <20251202121856.0da62885@kmaincent-XPS-13-7390>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251202121856.0da62885@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2025 12:18, Kory Maincent wrote:
> On Tue, 2 Dec 2025 11:47:40 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 02/12/2025 11:44, Kory Maincent wrote:
>>> On Tue, 2 Dec 2025 11:28:55 +0100
>>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>   
>>>> On 02/12/2025 10:42, Kory Maincent wrote:  
>>>>>      
>>>>>> Stuffing DTS change in the middle of the driver change tries to hide
>>>>>> impact, which is not nice on its own.    
>>>>>
>>>>> As it needs driver change before the removal for not breaking things it
>>>>> can't be done at the beginning of the series.    
>>>>
>>>> And that is the problem which should stop you there and rethink how to
>>>> organize it without impacting users. DTS cannot go via DRM. If that was
>>>> your intention, that's my:
>>>>
>>>> NAK  
>>>
>>> My intention was to raise discussion over the ugly and legacy tilcdc-panel
>>> binding and what to do with it. But it seems you don't want to, that's a
>>> shame.  
>>
>> I don't see how you get to these conclusions. I comment that putting
>> here DTS in the middle without any explanation of the impact is not
>> correct and this one alone I disagree with.
> 
> Because you didn't replied to the first line of my answer:
> "Yes, I know this but I still wanted to try and begin a discussion on this, as I
> really thought it is not a good idea to add and maintain an new non-standard
> panel driver solely for this tilcdc panel binding."
> 
> But indeed you are right, I should have put more explanation on why there is DTS
> and binding change in the middle of the series. Sorry for that.
>  
>> From that you claim I don't want to fix things...
>>
>> DTS cannot go to drm, which means you either need to separate the change
>> and make entire work bisectable and backwards compatible for some time
>> OR at least document clearly the impact as we always ask.
> 
> The thing is, if I split it, it has to be in 3. One for the of DRM bus flags
> support, a second for the the devicetree and binding change and a third for the
> whole tilcdc and tda998x cleaning stuff. I think I will go for one series, with
> better documentation.
> 
> Now, what is your point of view on my question. Will you nak any binding
> removal even if the binding is ugly and legacy and imply maintaining an
> non-standard tilcdc panel driver? I know it breaks DTB compatibility but there
> is several argument to not keep it. See patch 6.

I will not NAK, removing bindings and breaking users is under some
conditions acceptable. You just need to come with the reasons and impact.

Reason "is ugly" is usually not good enough. Especially if things were
working.

Best regards,
Krzysztof

