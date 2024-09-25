Return-Path: <linux-omap+bounces-2250-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857749866F3
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 21:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4467B285D6C
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 19:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECC7145323;
	Wed, 25 Sep 2024 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="d25R1Nl6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E2B38DE4;
	Wed, 25 Sep 2024 19:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292953; cv=none; b=TtyAXJ3wDVWIHxBi7GfD5AUdLTqHenWO/h/YPqY5pwtTuglNkN11dlV2nZRanzwwjva4/3UY/Dsc3IP6WibsBZ5VxhLt3jK0ucjDQhKnpQppaNVXZNEyhqiXWmsAMbKmBgEkY3j9+q0wZzw86IfCZTGmXq92YJa/nbFlwtdvJwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292953; c=relaxed/simple;
	bh=W1htSqqTN7odWFnelYUc3taH1Vevq2GYu5/u0ivvThM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0Qh6s6Sbh+ikRUGVgCa6GMvB1AZt+VlBUpW8tsz1sL3lqbbv7zs3KeKVeT5kjX9XrAGxZkDvXbMfyW1yhgyYtt6lxJvt3Z+pMHqebqr9Rw7sDZCJdUsyND5GRUCGOrCcBcrF9TJyitEUOotYzsv1aKI0IqqckCCaznowX6fT+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=d25R1Nl6; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727292940; x=1727897740; i=deller@gmx.de;
	bh=UB8PYpZok1cm1fKMdh4ZJQbRWVWkKAGkJRWWz1kVeZg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d25R1Nl6uF75x6VL2EaFtfT77epmiA6ICHST9kRIWTzLHpVAsnG6nkQNnr6JX/Ht
	 9mMj3IIY4BzqvI/NDyD2mF1U2o/o58OwfAcKJMQzjw7oseR4nyuJOlqm/M+1r8+lu
	 l0siMsbwiGE2mu1cCvOBRPshoDfizILbgHQh4W7Xq58Lu9xsdTvaUzel/G+b9oNjT
	 j3TJzyrgArTpu2uM+9Q/io56k0OAR7WKQcUdWaB350R34trNJW00Petmlre85PMQk
	 gqJBv1/k9S7h/gBlU5/gwgX60LUQP/9HTtodGoPNCCswjCnJfTyGT3z6+IcMpzxiY
	 /w1ZFZzJdGusGBZGpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXtY-1sT2jb3dvE-00WlAq; Wed, 25
 Sep 2024 21:35:39 +0200
Message-ID: <42d8b0ac-edb4-41be-9b7e-87626889e33b@gmx.de>
Date: Wed, 25 Sep 2024 21:35:37 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omapfb: Call of_node_put(ep) only once in
 omapdss_of_find_source_for_first_ep()
To: Markus Elfring <Markus.Elfring@web.de>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dave Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <f7a08897-94cb-4776-9aee-c6ca9fbfd750@web.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <f7a08897-94cb-4776-9aee-c6ca9fbfd750@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nawLftjT8T401jHGx+NfGosxAeVyt8qpLFVIBuIZBQl+gwF2JOo
 O4pYQuGFx8jA8Po7zSeaS5KCqdUQ3DVK9W23bgX40IRFd37J3zOZ4JhR7DLtiY/NfS8laf4
 1GsUv7qVaui4Jt/UtjXrTQI/B2gRb9xtKhH88FX32yFaPWLt0i3+BLrG/H+NUIlLr8HL3e4
 p+8C+r1Ue1JVAnNARr9Ww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2QQ4RunGkjA=;dp/f057ANWAS2lP+JeMzJGAerOE
 rv6DkJO46DGV9kC32DfW6+67IOPqY+fBRWv/0pzrsNhxYUPsmfPIT8LcyqZ66orKEAAjpJrH+
 4YfGD8Uhp8fXfkRWXtzg0Qj/5F4lR0DKI6FywT73QeALrGVCYCHvhh328kGwafuxyCjbtQwTt
 7quaTTYlPHGF0HaE6IUYTt9esveDRN2h1aejonuqqWLaBs4J+GJnY9qG1LxD59pJX7Snuz7dL
 907qwmFkKIIV8vKTEPJpf6mQ/ewu0BXZfNu6q1N5BnCWXxbwLDsWvDy4K4lWUWmGmAEhv4Qp4
 gPfNGJoWKmHrGSvCoq2zFyVJPbxf6ZhPFoALBORHhCG00BxiHvbcAVVr111IeazcYZ7girX4x
 0f3nAAD6FlOlw2jSBdB/EK/jNGIV8POaH5CijDdM2YAN3E42219cMdjgF8m3AxKdFKUnqgnt1
 ulmZI/ntil0/gvPr7oscjFybXImgnUuoa3+AJg55DhDHtWaBLFYoE840zAWNAkrjZT6WpCrOe
 4n15FTEQA4+e4ACQ/UBBP7N1DcaRWyw4DCsjZlxoDav4n4PaKxxjV5+wdrfSOdH5UPaEJGL9v
 xUxymuaTkvW7EVwoND7WoUL39oECgIRLk1DmnGOc/ntMm2+Y1XFvmdEuKtV8U0WS5huE38V4C
 QPDpajv8D2WKTQcmiTXBfFIlygWWj9U8zhR05U3AyMMOjI93SmCWYvMXAa/NSEShRU6zLK+Zg
 ZOXdsibFr8dcIIL3bVN3UYGpOulBLdS1jzBjwl3DIikO1N8xijqYdl07aV3V3WIhIO8m26jPp
 /CENVoRnBiBIQRAWOrs+zW2Q==

On 9/25/24 21:21, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 25 Sep 2024 21:12:36 +0200
>
> An of_node_put(ep) call was immediately used after a pointer check
> for a of_graph_get_remote_port() call in this function implementation.
> Thus call such a function only once instead directly before the check.
>
> This issue was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/vid=
eo/fbdev/omap2/omapfb/dss/dss-of.c
> index 4040e247e026..d5a43b3bf45e 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -129,12 +129,9 @@ omapdss_of_find_source_for_first_ep(struct device_n=
ode *node)
>   		return ERR_PTR(-EINVAL);
>
>   	src_port =3D of_graph_get_remote_port(ep);
> -	if (!src_port) {
> -		of_node_put(ep);
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>   	of_node_put(ep);
> +	if (!src_port)
> +		return ERR_PTR(-EINVAL);
>
>   	src =3D omap_dss_find_output_by_port_node(src_port);
>
> --
> 2.46.1
>


