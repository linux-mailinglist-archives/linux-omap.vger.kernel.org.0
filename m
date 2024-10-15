Return-Path: <linux-omap+bounces-2430-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7399F696
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 20:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC4DA28330C
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 18:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7C81B6CFE;
	Tue, 15 Oct 2024 18:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="XhIh3es0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63441F80DF;
	Tue, 15 Oct 2024 18:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018419; cv=none; b=JDEIPyHmrIUJsb+OnO9+p6Jobi985o2833IQnYqgPxZUc5hDLPRBKW/fFy1Q5RR6VICPZ2fZyoIlzT7kBHSrEXMU6oJnGk75PxTOQ7/RFDl652kHfHmXb6NANTgpP1Ca+5tlualwOtVU8GT5e+gM6Xrw8znK+fu3lh00Ufigyuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018419; c=relaxed/simple;
	bh=FnvPIsPJXXekymtGe9+tlCMWyTNarqOY411JwMK9xXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l1L8jR91N6xxKEXVQlwlQL3ZELS8yJnCDEmcaNLxAaZj5faE4wNRlYjn4CA8xja4W33OhtN4cjaub3qWgmy7MqxHr9g7eHfFMoaO3YZEienosAasGeDf6iT5uOqch3LCkTvYyu3pXuvuWkVELC3BzC81KIGzPprplQywwAzISlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=XhIh3es0; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729018395; x=1729623195; i=deller@gmx.de;
	bh=/4lCssT+YxgQtaLjUjFf7pmDtxcsWNYEpDD9ZxoWbWE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XhIh3es0T3mmY4YPODzwoJg50iq7lLmBh5XdP6N9t7qV/6wbsnAU8+5UxbKsez4V
	 ooqxT+w02b1AcpMyTQbN6J9fw2qtgSSKlQZsuVBhDWGb3wn82mteL3Xiuw6pfetgL
	 sYESuKkjlMZMsPaGlL0P/H0s3HTSwLYEJzy+5nPw7Rz1Lxl9Ux2x8cEItcIqCIAn/
	 qu/idri56jSff+qkIKE3Hxn3AjMfc2QEKB1T1657Usva+UXlJFFDJoWSqRJSJ3cXd
	 iOAHe5C2R8CB5zZGwcGVX9CwolZB5JC6Fhu05+uibmo9OJhwMEW3xT8nXYzdKJ9cr
	 Y8yLMbwSITYnaCf2gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma24s-1tUVIt2oVw-00SG6H; Tue, 15
 Oct 2024 20:53:15 +0200
Message-ID: <2981d860-ea1e-4973-839b-1c5bbfe9a1b2@gmx.de>
Date: Tue, 15 Oct 2024 20:53:14 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/9] gpu: drm: omapdrm: use new of_graph functions
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87msjerqvc.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87msjerqvc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GMZwETlnB80Lx7Otxy4eciy8ZRlWTkiD3kOGYHPUY+DW0DX7Sk+
 Nz6yJ7efbum5vN1tDD9Dlnt3UHEYyic6GqUmkj3eTC/O8W4/oQWqn2rgHU+WD0O/MyExG7g
 BGCxHyUr/MRxQEpBhCWHW18JGepRdF5WOgiMozEECgHYSFbeux3Imoh7ATBpwX5l+1LWC7z
 TBfrKEKBmeiVYnnvdeR/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M9nxfO0ieLk=;HGpKT2hr0ywTMcNBYmZ+kEtFgPm
 7yWjFAi4wPel1wpdJCNOCFD7cujb7i990YvEaLXWRoOMMW15ikXUtwZDYGroLrMYl6V5xkOou
 uBvAIX+ICdneoSBA+TUqF3VR4QD5JAxOueXxE0KgCGqla2Vy1k5MFoZ07dKEIcOIuz+S8I73j
 JSbSPRIs8G2OExkpprbfKl1mveT5gB19g2y9lNY5VA8WeHS3car+FjtG0cSEe3XT1wZVxo3gl
 gBKhJEIW+JPkSinFxxwv3U6Dq0l+TolXSxTg+Y7AGCamH2z1tIh1faox0C6o8UI2C9/6Hj89I
 zY1bwK1/FmRwcXODy2o1XfbUKoOg8ppWGpxKGtAwAdeeKz7j1b3znSu0lpmFxk4+FeKNJIkSL
 kFSZgvXNbPoXKapj97w7ilZlXsso0ut8HBZsiMWuOPDXXOnonrgXuRvoYK9We+ooY/zWwIpCm
 TVscp0UrQrNvAgl4FJTM9E13pHJcNdONEVuCwEOymoMwmaRwDw3nNQPEDtjK2oLOt5cGECrA0
 WQbQtLrX/eH77zyMeuuuUPMt8KnfKTRbPtwd1c2Cr34NoEUf5vU0R1fDBrdA2TkHdQtfZJJ30
 sORoRqXJqhP0FYVJcjunFt94vCO/T+NEvadP0EFx+LYyqIJZ3gIMjTOAvqYZ7xz1E5uySvdTy
 tJq1Oc8azbYP6YmkJdvbUcfwjzOe7K1TkAXjsiWpVATxID1oECLpj+0XMZlph1BjtdhKSh2Dg
 Rjb0Upa/keHA24ZDq27eA2H/A23xrbmoSUXwICQnhLCBl3b0fjEMQVt6X8kHMfU52Qgozs2QR
 f4+Ma3DKCwORYv9FIKP+Px4A==

On 10/9/24 03:45, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Acked-by: Helge Deller <deller@gmx.de>

> ---
>   drivers/gpu/drm/omapdrm/dss/dpi.c | 3 ++-
>   drivers/gpu/drm/omapdrm/dss/sdi.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm=
/dss/dpi.c
> index 030f997eccd0..b17e77f700dd 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dpi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
> @@ -16,6 +16,7 @@
>   #include <linux/export.h>
>   #include <linux/kernel.h>
>   #include <linux/of.h>
> +#include <linux/of_graph.h>
>   #include <linux/platform_device.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/string.h>
> @@ -709,7 +710,7 @@ int dpi_init_port(struct dss_device *dss, struct pla=
tform_device *pdev,
>   	if (!dpi)
>   		return -ENOMEM;
>
> -	ep =3D of_get_next_child(port, NULL);
> +	ep =3D of_graph_get_next_port_endpoint(port, NULL);
>   	if (!ep)
>   		return 0;
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm=
/dss/sdi.c
> index 91eaae3b9481..f9ae358e8e52 100644
> --- a/drivers/gpu/drm/omapdrm/dss/sdi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
> @@ -11,6 +11,7 @@
>   #include <linux/export.h>
>   #include <linux/kernel.h>
>   #include <linux/of.h>
> +#include <linux/of_graph.h>
>   #include <linux/platform_device.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/string.h>
> @@ -346,7 +347,7 @@ int sdi_init_port(struct dss_device *dss, struct pla=
tform_device *pdev,
>   	if (!sdi)
>   		return -ENOMEM;
>
> -	ep =3D of_get_next_child(port, NULL);
> +	ep =3D of_graph_get_next_port_endpoint(port, NULL);
>   	if (!ep) {
>   		r =3D 0;
>   		goto err_free;


