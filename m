Return-Path: <linux-omap+bounces-1502-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC28FFBF3
	for <lists+linux-omap@lfdr.de>; Fri,  7 Jun 2024 08:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73EF31C2107B
	for <lists+linux-omap@lfdr.de>; Fri,  7 Jun 2024 06:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAFC14F9C9;
	Fri,  7 Jun 2024 06:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norik.com header.i=@norik.com header.b="E/5+aOH2"
X-Original-To: linux-omap@vger.kernel.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0113F43A;
	Fri,  7 Jun 2024 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717740885; cv=none; b=QBgeqKvL/vu/z2m0bVOaVKYFjQiOM1eGJw7/Bt3BU/dsF2q0HxvlCe60HhVJ565J799wmdrortGuX8CekZf7jC3zAFF0uWGYGaWz92kxduGx++a79/hvnbG9OzrhCRmWaFijTn92OsiG274W4AFwcjj5+0MSAwKafe4C9kaXXHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717740885; c=relaxed/simple;
	bh=E44XiueJpOmG0UDbwDwwFtCzJsFzM/AcIjGJQz3r3/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ha63NUaWPINuXBB1XB7qd9m/UxB/7wLDECmuJGUls7P86+rGEu5iYbxdKD4Vok4RaI+2sQ3qA04c1KZo76D12yfIakokDS2li0diy201uqsAhRP8emYj6v+khBAH9bWdIK4ViV8SfhhuHH2e706HaGITeKYqNvKEnyCH+YOICOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=E/5+aOH2; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I/oNhRwc6Wd73jsIJiFBr4U+0PGZF33BeCX5Kedx5c4=; b=E/5+aOH2+kNveqdTwTjoIMEvx1
	NxWxTnmElm11/qpvW6SlCtvr1f+qCybQLJmaxf6ewL73kGWZgRDnhgwiM2+gcILj2FF8I5HaevMC8
	D4Nxr2V32VDYRkoU4CDznL7iRSaenyfteuaZnFV1nqgH1qlPUFJZVeBTjkSRT9jJbPo+1he2xnQIP
	ADvYtifYeltAB3qjzBeiIHCoWCSVGuwUpK/DOfHpLcvhIUj2xXnQXpaIplkoHTyjYDI9emwP5Jkyj
	GKK4r0KjQ1PuohrrtrEjM9giqFkXcAZO39XD2zq8/eaziiXWFX8v77IscotJn0qyfbvBRKdYBbJPh
	c3ZlM9qQ==;
Received: from [89.212.21.243] (port=57710 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1sFSs5-00FHTK-2x;
	Fri, 07 Jun 2024 08:14:41 +0200
Message-ID: <fe0ec57b-dad3-4666-abe3-75bcb65fa7df@norik.com>
Date: Fri, 7 Jun 2024 08:14:40 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Fix too long driver name
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?P=C3=A9ter_Ujfalusi?=
 <peter.ujfalusi@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20240606070645.3519459-1-primoz.fiser@norik.com>
 <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
 <71d7754e-f72c-4a04-b03e-a0ee0e24c9e0@sirena.org.uk>
From: Primoz Fiser <primoz.fiser@norik.com>
Content-Language: en-US
Organization: Norik systems d.o.o.
In-Reply-To: <71d7754e-f72c-4a04-b03e-a0ee0e24c9e0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi,

On 6. 06. 24 20:01, Mark Brown wrote:
> On Thu, Jun 06, 2024 at 09:00:47PM +0300, Péter Ujfalusi wrote:
>> On 6/6/24 10:06 AM, Primoz Fiser wrote:
> 
>>> -	card->name = devm_kasprintf(dev, GFP_KERNEL,
>>> -				    "HDMI %s", dev_name(ad->dssdev));
>>> -	if (!card->name)
>>> -		return -ENOMEM;
>>> -
>>> +	card->name = DRV_NAME;
> 
>> I think it would be better to name is simply "HDMI" instead
> 
> That does seem a bit more user friendly.

So card->name = "HDMI" for v2?

Thanks,
BR,
Primoz

-- 
Primoz Fiser                    | phone: +386-41-390-545
<tel:+386-41-390-545> |
---------------------------------------------------------|
Norik systems d.o.o.            | https://www.norik.com
<https://www.norik.com>  |
Your embedded software partner  | email: info@norik.com
<mailto:info@norik.com> |
Slovenia, EU                    | phone: +386-41-540-545
<tel:+386-41-540-545> |


