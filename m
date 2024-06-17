Return-Path: <linux-omap+bounces-1546-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B290A37F
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2024 07:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A21C8281D1C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2024 05:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45D7181CFA;
	Mon, 17 Jun 2024 05:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="uIOLRH3I"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303812F5B;
	Mon, 17 Jun 2024 05:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718603653; cv=none; b=FFrDoYP2zYdEAWmvnYn2YZ9aiP5JJgZyu+38XCTZyH1rFXr1GgGQJC3ey7HY0RR7Q05DUj3RjrZMpfwR9b34dm4gc72TuWki20DAVNpjMF/aZ+NDl6O9wQn4gQXstd25B2dzd+HYbO/UL0zcz/HhZQ1hYVl89Ixk0LkVub8e9Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718603653; c=relaxed/simple;
	bh=4M9bJC2im8EC3ehNn3IdDa7pv05Da0fEOcRlVS566ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qjBohICdMNL2ZcNewlZkYIl979XJjLW5mSwsvja0z0fnfbdBk8H3swK/xyfOz+H3aCRLkpUUeclByQvpCCHZ0MF/4M/aQCbko7yWBCdl3gyvvGtG3cP89TYcYX8Jxgkx2OAbpaV2x4UQjgLJk07YCKDYSpHrIpZPI510MQEi7L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=uIOLRH3I; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718603637; x=1719208437; i=deller@gmx.de;
	bh=oakIaaFQS9p+3YLmGMVTxIkHRlaGNzy/TtYdT7umKlQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uIOLRH3II5DZTDVPnydHPhRRk8S2anbfkyE7gXXfsCIjIOc1zuOUpePJ6nwYP5NV
	 QIXEhfiZPxHH7UV43bqDXvTP69+jmyfQBQTN5Rud3sCnv1cU7ixWiqzwJDs2QTveV
	 WBciBwE9pK8X+Mpcz+coFI0fCsFXUI3cDhA8G0aSuaOlj6Ha1vn9CEUb4nvWXsbnL
	 sP8abGc3jpa9cECgbype1tq1ASmXz4QvB/eLfw9tkCTFbRelRFQmQuwRMdqgS/aV/
	 6LYSIFIbRNJOMPPtPj0/dqIHYbTsGWPHjSj93P3j3q4MvHfTvPabjUSJg0vxRdx7j
	 FTuywapdDhHKha7afA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwXh-1s7ppk1TmT-006VoK; Mon, 17
 Jun 2024 07:53:57 +0200
Message-ID: <84b56892-e172-44d7-9b09-a2eae3a24dd7@gmx.de>
Date: Mon, 17 Jun 2024 07:53:55 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 resend 8/9] video: fbdev: use
 for_each_endpoint_of_node()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
 <87jzios7t6.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87jzios7t6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uNCDekLbyvIvaGfLmQqH/70IByajvIZVa+1xbf89g+5YDbKBgLh
 ueiha2kJVHFlaogibjkZSPK2pAfVZaK/aJ/aAEAyjGlWmjuNeyMlFCHAu+vA3TatyhcEJ4R
 vbyBlFA0kbn6S2Lf1VC6O11uWLhC/1I4R87xVy9IDMF5Q0kgT9ilw/6cWS1OEPoSFZZzcFn
 fzO4uXJI2v2QfwGl71Xfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gw4kfyx0zYg=;daTPmYDdr41yAFCBvxYsLSA3cPd
 W9uxQqMyI/AsQt+vYizn53xKM+vH2kkusXvoLEbDkRCyhSuxPIEPgl6RJnjnT7tnxAMh8Kp3P
 enQsz9kHAL5rgiczu2wNDxvV/nX/xLN1z+nhYw3yNFjOHZPBTYpTFhTZ6ntJSLfyEYZuvhhVO
 rH2UCfypPXjXiiwl259+sBLsrmRLc6cUeY5gzpXnpZuOrgUxcFQOBmVXOp0IbFgNFHVLsQmiG
 KO3RVbj5STaVQIGjJip2X1dvQzx43FTrepO5N4tgzznYAHp49uZLi8mRwis/tpuAy6/+9h3k3
 KBC7X4wmTMxTkokiITf5hlFSDQWzJ9xbMkmBxwxsWeeQL0ve3cLq8FK0usqfvdgFkHhpi7dth
 AApiVsNnN3BthrKq8CDyEC6P/hCaigg/9X8g1PqugMpDpjs+FXKLkzvlGz5aTWwVhmqZNQSHD
 lCyDqy2u15T46yej91klyEEnc5i/xlho/AaTuCjium7/8oW+wY7oXafv9QTUuoMD6EhCllG3C
 x2fOmLI3yninr1o59FYF2ZbTRBTswKbRjRVXMNkvXaGWsRo4Sb+PIxBfrngU6Q4mxNA2Ql2aM
 CNnbKD8dvYrZQh7dm73cUufxiKfNnKcCLCRRcicE+vXOL7WlM4ZNqfL0qGHqI48u19vMdj8xr
 IxA/G2pcM/3Rjca7XptNJsKKgPxS0qvAx0PXRdmoxlVtKnZ7CtwdEGD7vHfCylB55BYif1fde
 J07cX+3jSoZSp4ebDCYV1s8+5pIeiA1UywgNIGFw3gaaixpDFww6bdquQ98T4MwTO2fw1k7/6
 TjnIGgp9rMPNPazobSDEIXoWPOi9zu+Si4DK5z+bFKxqE=

On 6/17/24 02:59, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com=
>

applied to fbdev git tree.

Thanks!
Helge

> ---
>   drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/=
drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> index 09f719af0d0c9..d80720c843235 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> @@ -149,8 +149,7 @@ static void __init omapdss_walk_device(struct device=
_node *node, bool root)
>
>   	of_node_put(n);
>
> -	n =3D NULL;
> -	while ((n =3D of_graph_get_next_endpoint(node, n)) !=3D NULL) {
> +	for_each_endpoint_of_node(node, n) {
>   		struct device_node *pn;
>
>   		pn =3D of_graph_get_remote_port_parent(n);


