Return-Path: <linux-omap+bounces-509-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A2884B840
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 15:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B55C28CC9E
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 14:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E9F132C28;
	Tue,  6 Feb 2024 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="kFXpchdr"
X-Original-To: linux-omap@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35FE41A81
	for <linux-omap@vger.kernel.org>; Tue,  6 Feb 2024 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707230762; cv=none; b=tup9fRVaB0o+EQw+cI8boi45NjldcOuWNsdDAlzzL/Az4y0Tc4DuWO1btVfeUK1rlVlGVuszPordY1lpkJ9o/Ok5ACI8huoBMUz02yG3Wux9iiNFC4elAjr/Ahld1GuKAmTZ71XFuEU7cI++cj2DvNNt6xmCLXtNFPCrSSbNFcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707230762; c=relaxed/simple;
	bh=008NZlIIKKcRbZtY8WBgHmga9ePdRnsihK5UNUmHyPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEXCuweR5ITb+iihfzhZpX6Kir8TUMEMx00HYmXrgzr7sY2yBQnIEFLw6WqzLz5yrTsIXM6gdbUo74RxRX2SZX8QgneO6QFOYNdRQFdqHEPxA0MfQ9fDpaUANJHnwBzLgRDHBE5/mV8sFvig3KApH1WR3SXsjSapJdHalw9r3Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=kFXpchdr; arc=none smtp.client-ip=195.121.94.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 4568c7c9-c4fe-11ee-a95f-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 4568c7c9-c4fe-11ee-a95f-005056abbe64;
	Tue, 06 Feb 2024 15:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=sVhg6tYMRf/3ZgsSwv4ezK1ZnRtWNigTMohOSfmrdrE=;
	b=kFXpchdrx+O53J8720yZPPvK1ytij006qCuLoTG3gApM9Cdp4+puc/qoV5SKXKNuv6lI7wfMlIsYG
	 7Im1VLd2ePLDn0oCfoboaZRykl3Oa1mpINk3G5BlRZb9LmUrP15DXRBvawOh0m703mxnGtAakWaoWI
	 OzJOYupc21hp3US9QlZOdPLHMAS/h9Lvq9mPq/y8IZ7JKsLgbSCr4xXcMpxxeClGr3FpTYgQh3xm+w
	 /lwDLmqMZMGOHjzknJiKMK39WmliYMGQf7jyCVIsoq0m0pCZ+J4NU9d59juC3Zrfa7cAPnCDY4LW+a
	 D0P2Dwp/Xz4KaUY39LXtRnJ/MukLSgg==
X-KPN-MID: 33|jA6uH9xZgY1knbeKSi6dhq/1oOne2U8bpKIfge1alGbmiWw4WtZRL/JrdrTtnHN
 7Bs0IK6MayUV9ZziGAXmUz8VwwxLoQDVWspwFsUV8srA=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|rcDDLhX3Pfqvt4pErGfwvkDsq0AYsFBHimHVqPC05g52A/YFh5ohXgVG1DNg/PT
 DpGkua0lo4qtTk/w7m3A0EQ==
Received: from [10.47.75.249] (unknown [173.38.220.58])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 456b66ec-c4fe-11ee-a7ca-005056ab7447;
	Tue, 06 Feb 2024 15:44:47 +0100 (CET)
Message-ID: <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl>
Date: Tue, 6 Feb 2024 15:44:45 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: replace of_graph_get_next_endpoint()
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Eugen Hristev
 <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Russell King <linux@armlinux.org.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sam Ravnborg
 <sam@ravnborg.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Harvey <tharvey@gateworks.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240206134155.GB2827@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/6/24 14:41, Laurent Pinchart wrote:
> Hi Morimoto-san,
> 
> (Adding Krzysztof Hałasa)
> 
> Thank you for the patch.
> 
> On Tue, Feb 06, 2024 at 02:55:27AM +0000, Kuninori Morimoto wrote:
>> From DT point of view, in general, drivers should be asking for a
>> specific port number because their function is fixed in the binding.
>>
>> of_graph_get_next_endpoint() doesn't match to this concept.
>>
>> Simply replace
>>
>> 	- of_graph_get_next_endpoint(xxx, NULL);
>> 	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);
>>
>> Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>>  drivers/media/i2c/adv7343.c              | 2 +-
>>  drivers/media/i2c/adv7604.c              | 2 +-
>>  drivers/media/i2c/mt9p031.c              | 2 +-
>>  drivers/media/i2c/mt9v032.c              | 2 +-
>>  drivers/media/i2c/ov2659.c               | 2 +-
>>  drivers/media/i2c/ov5645.c               | 2 +-
>>  drivers/media/i2c/ov5647.c               | 2 +-
>>  drivers/media/i2c/s5c73m3/s5c73m3-core.c | 2 +-
>>  drivers/media/i2c/s5k5baf.c              | 2 +-
>>  drivers/media/i2c/tc358743.c             | 2 +-
>>  drivers/media/i2c/tda1997x.c             | 2 +-
>>  drivers/media/i2c/tvp514x.c              | 2 +-
>>  drivers/media/i2c/tvp7002.c              | 2 +-
>>  13 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
>> index ff21cd4744d3..4fbe4e18570e 100644
>> --- a/drivers/media/i2c/adv7343.c
>> +++ b/drivers/media/i2c/adv7343.c
>> @@ -403,7 +403,7 @@ adv7343_get_pdata(struct i2c_client *client)
>>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>>  		return client->dev.platform_data;
>>  
>> -	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
>> +	np = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>>  	if (!np)
>>  		return NULL;
>>  
>> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
>> index b202a85fbeaa..dcfdbb975473 100644
>> --- a/drivers/media/i2c/adv7604.c
>> +++ b/drivers/media/i2c/adv7604.c
>> @@ -3205,7 +3205,7 @@ static int adv76xx_parse_dt(struct adv76xx_state *state)
>>  	np = state->i2c_clients[ADV76XX_PAGE_IO]->dev.of_node;
>>  
>>  	/* Parse the endpoint. */
>> -	endpoint = of_graph_get_next_endpoint(np, NULL);
>> +	endpoint = of_graph_get_endpoint_by_regs(np, 0, -1);
> 
> I think this should be port 1 for the adv7611 and port2 for the adv7612.
> The adv7610 may need to use port 1 too, but the bindings likely need to
> be updated.
> 
> Hans, Krzysztof, any opinion ?

It looks like it. But I suspect the code never worked. The endpoint parsing
is only needed if a specific mbus type is used (i.e., not 'UNKNOWN'), and
I don't think that is used in the device trees in the kernel. So everything
silently falls back to UNKNOWN and some default bus config that 'just works' (tm).

I'm pretty sure this code is wrong, but nobody ever noticed. Changing it
to the new code just makes it bug-compatible :-)

Ideally someone would have to actually test this, perhaps with one of those
Renesas boards. While I do have one, it got bricked after I attempted a
u-boot update :-(

Regards,

	Hans

> 
>>  	if (!endpoint)
>>  		return -EINVAL;
>>  
>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>> index 348f1e1098fb..c57a0d436421 100644
>> --- a/drivers/media/i2c/mt9p031.c
>> +++ b/drivers/media/i2c/mt9p031.c
>> @@ -1080,7 +1080,7 @@ mt9p031_get_pdata(struct i2c_client *client)
>>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>>  		return client->dev.platform_data;
>>  
>> -	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
>> +	np = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>>  	if (!np)
>>  		return NULL;
>>  
>> diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
>> index 1c6f6cea1204..14d277680fa2 100644
>> --- a/drivers/media/i2c/mt9v032.c
>> +++ b/drivers/media/i2c/mt9v032.c
>> @@ -1008,7 +1008,7 @@ mt9v032_get_pdata(struct i2c_client *client)
>>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>>  		return client->dev.platform_data;
>>  
>> -	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
>> +	np = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>>  	if (!np)
>>  		return NULL;
>>  
>> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
>> index 2c3dbe164eb6..edea62a02320 100644
>> --- a/drivers/media/i2c/ov2659.c
>> +++ b/drivers/media/i2c/ov2659.c
>> @@ -1388,7 +1388,7 @@ ov2659_get_pdata(struct i2c_client *client)
>>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>>  		return client->dev.platform_data;
>>  
>> -	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
>> +	endpoint = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>>  	if (!endpoint)
>>  		return NULL;
>>  
>> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
>> index a70db7e601a4..31d214bd4a83 100644
>> --- a/drivers/media/i2c/ov5645.c
>> +++ b/drivers/media/i2c/ov5645.c
>> @@ -1053,7 +1053,7 @@ static int ov5645_probe(struct i2c_client *client)
>>  	ov5645->i2c_client = client;
>>  	ov5645->dev = dev;
>>  
>> -	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
>> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>>  	if (!endpoint) {
>>  		dev_err(dev, "endpoint node not found\n");
>>  		return -EINVAL;
>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>> index dcfe3129c63a..beab2813c672 100644
>> --- a/drivers/media/i2c/ov5647.c
>> +++ b/drivers/media/i2c/ov5647.c
>> @@ -1363,7 +1363,7 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
>>  	struct device_node *ep;
>>  	int ret;
>>  
>> -	ep = of_graph_get_next_endpoint(np, NULL);
>> +	ep = of_graph_get_endpoint_by_regs(np, 0, -1);
>>  	if (!ep)
>>  		return -EINVAL;
>>  
>> diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
>> index ed5b10731a14..aaec5f64f31a 100644
>> --- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
>> +++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
>> @@ -1555,7 +1555,7 @@ static int s5c73m3_get_dt_data(struct s5c73m3 *state)
>>  				     "failed to request gpio S5C73M3_RST\n");
>>  	gpiod_set_consumer_name(state->reset, "S5C73M3_RST");
>>  
>> -	node_ep = of_graph_get_next_endpoint(node, NULL);
>> +	node_ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>>  	if (!node_ep) {
>>  		dev_warn(dev, "no endpoint defined for node: %pOF\n", node);
>>  		return 0;
>> diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
>> index 67da2045f543..af7e49e6cc5b 100644
>> --- a/drivers/media/i2c/s5k5baf.c
>> +++ b/drivers/media/i2c/s5k5baf.c
>> @@ -1836,7 +1836,7 @@ static int s5k5baf_parse_device_node(struct s5k5baf *state, struct device *dev)
>>  			 state->mclk_frequency);
>>  	}
>>  
>> -	node_ep = of_graph_get_next_endpoint(node, NULL);
>> +	node_ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>>  	if (!node_ep) {
>>  		dev_err(dev, "no endpoint defined at node %pOF\n", node);
>>  		return -EINVAL;
>> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
>> index 2785935da497..872e802cdfbe 100644
>> --- a/drivers/media/i2c/tc358743.c
>> +++ b/drivers/media/i2c/tc358743.c
>> @@ -1895,7 +1895,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
>>  		return dev_err_probe(dev, PTR_ERR(refclk),
>>  				     "failed to get refclk\n");
>>  
>> -	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
>> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>>  	if (!ep) {
>>  		dev_err(dev, "missing endpoint node\n");
>>  		return -EINVAL;
>> diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
>> index 325e99125941..662efd5e69b9 100644
>> --- a/drivers/media/i2c/tda1997x.c
>> +++ b/drivers/media/i2c/tda1997x.c
>> @@ -2307,7 +2307,7 @@ static int tda1997x_parse_dt(struct tda1997x_state *state)
>>  	pdata->vidout_sel_de = DE_FREF_SEL_DE_VHREF;
>>  
>>  	np = state->client->dev.of_node;
>> -	ep = of_graph_get_next_endpoint(np, NULL);
>> +	ep = of_graph_get_endpoint_by_regs(np, 0, -1);
>>  	if (!ep)
>>  		return -EINVAL;
>>  
>> diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
>> index c37f605cb75f..b1630a6c396b 100644
>> --- a/drivers/media/i2c/tvp514x.c
>> +++ b/drivers/media/i2c/tvp514x.c
>> @@ -988,7 +988,7 @@ tvp514x_get_pdata(struct i2c_client *client)
>>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>>  		return client->dev.platform_data;
>>  
>> -	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
>> +	endpoint = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>>  	if (!endpoint)
>>  		return NULL;
>>  
>> diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
>> index a2d7bc799849..8e58ce400df2 100644
>> --- a/drivers/media/i2c/tvp7002.c
>> +++ b/drivers/media/i2c/tvp7002.c
>> @@ -893,7 +893,7 @@ tvp7002_get_pdata(struct i2c_client *client)
>>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>>  		return client->dev.platform_data;
>>  
>> -	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
>> +	endpoint = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>>  	if (!endpoint)
>>  		return NULL;
>>  
> 


