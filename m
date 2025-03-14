Return-Path: <linux-omap+bounces-3396-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA00A6108C
	for <lists+linux-omap@lfdr.de>; Fri, 14 Mar 2025 13:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE7E719C32A9
	for <lists+linux-omap@lfdr.de>; Fri, 14 Mar 2025 12:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A0F1FECCA;
	Fri, 14 Mar 2025 12:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yat42aFj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C311FDE3B
	for <linux-omap@vger.kernel.org>; Fri, 14 Mar 2025 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741953673; cv=none; b=AaNw02/t7grJp44RWD56tvKT5jyl7Hp1YQ1l03CUDc3UH8E94zjmrffi65yB9+A7QU4ygd3l6jhyExDPfzC7FBigBaVfG+tKcC2etLGb9j6a4DF3Tx4KZ6X6dqA694fe/XEZi4rx3x8zCjhQGXfr2bzWFOL0HhUQNZS0lfgKm1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741953673; c=relaxed/simple;
	bh=0EiFoivIfcK0VnjGA6hs9urmXfK68Rj6CImMeyaae+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THIKKMo5qHan1ncwB9g91yakdcSQytOTeCrRcG3axvIzFFUEeIHsNQGqngvKATImDaUB2XJaAV4J4ebFZLpEH8HcM7riebCucNu/1APdMjnpsS3cJ9EQfbwuxsOFOD/UedRQTy4w5AtpVpKbEdB534PZv1CdWEj8IJbKRl/kyus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yat42aFj; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f768e9be1aso30426947b3.0
        for <linux-omap@vger.kernel.org>; Fri, 14 Mar 2025 05:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741953670; x=1742558470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dwJmXPh0UZn8nk0X5v3R0BkMm6bGB9ygKP2kfBs4kzg=;
        b=Yat42aFj7MBEGwoS1hxwqKXAcRxLU6lhEOH9b/R1At6TpAi7VLLFObOq31R5oCFPhb
         pHYTQCme5LXShfXZA2TtaQfOaDugHKnj98QM5IrJCBW2Yv3pIthvkI3XXboURNx5Fl8w
         wYZUj/3DjlBKdcXfIOHoGUEsIkRtUDBGpkTB5G73bMzfojAR5mSUDSBANE0zNSN2+mnE
         D34ZUgex8WtogcKesZc61ZmehW1pPff94NRb6SgKJ4xIqisU1BtOn7Dme0WK37fDjy2o
         vieqM8c2sX+8NO+QivDhxqSU6GeYHOWOpeoNcuHnkqFBMmaomeiiLMom1lQ6p366I+vD
         Ks0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741953670; x=1742558470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwJmXPh0UZn8nk0X5v3R0BkMm6bGB9ygKP2kfBs4kzg=;
        b=EFqTb+iewe4vh6SagbStdXUo2jmLq+la8PFxeasRuU0J6oaOX/ooDc9X7ppz4eW7J/
         HSN/9vHpjF5rsSbfGmG5ew+m5Qwfu06sLnx3U9FJMD2gGlvogmpuZjPKGgPccMO9LYoQ
         7l6BnKZFWgMxHEuyZjA0m3CJXVz3Ss+V7ol8KD7qtGGFta0jLhgr12nwEtoG1XavCxSP
         hMZw5OsyQNarF2OUKFoAJokzZbB4QFJrpHcmrOrIWk9fnwnAZn4ByVp0m1GrLwY92jVu
         RyVNv+Bh6EViAkpXHGsUl3iosL9YZJ1AMhmiPnkLKwuOmxXVOwnJ1PYMIu9BqAHIYwey
         lVeA==
X-Forwarded-Encrypted: i=1; AJvYcCXBT7YBDrXZCYBG77ZxrJRqxvagUZ86lJAYEzgQCCllmSazrZj9ZmjQvrswsBzFd+KgRJEHwL2EWcKR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ztP3CqwY2XmIy+Ixi4I/7ItgnYXbx7jCwkEw4RE5/NyDDlq5
	bX+RwCE5KmqV2K/PdPBwzu4eYic/bFCSIxkDWWb6eL1tK6s4lXwnEIPGdEE4YACmDG8+8wBNN8f
	UqbW9h45eECw8d1E+vrdZE+O+uNXrCF3N2YhFzA==
X-Gm-Gg: ASbGncsa55bbSktcjrT8ll5TC3RNpBY8iYU32hyYi/WK3+pUoY57eiIUodlKI/ukjks
	bQNOyg/nF+Bx6xbn9A7X8VJllzf1hxWTlvE2hfHmnUsoQ6ri4zv+cfsxrp5p3kiaxhZK5BYR0QJ
	zKUb8zXVNicYj3FBrXEGTF4EzcKEE=
X-Google-Smtp-Source: AGHT+IGZZCcwY5/1JbZjTo0RWJ2K/xyqiqYRIB+WoabIYLpe9OvKoQa822klhbBDtTeF2wPU+BJ9g+hqI+KNvuehlJ8=
X-Received: by 2002:a05:690c:4c0a:b0:6f9:47ad:f5f1 with SMTP id
 00721157ae682-6ff4641f8cfmr21140237b3.17.1741953670170; Fri, 14 Mar 2025
 05:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org> <20250311-mvneta-xdp-meta-v1-3-36cf1c99790e@kernel.org>
In-Reply-To: <20250311-mvneta-xdp-meta-v1-3-36cf1c99790e@kernel.org>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 14 Mar 2025 14:00:33 +0200
X-Gm-Features: AQ5f1JqD4PpWF9sD-c3WrV8oOlJztNLgYA2GJMvNudQfJQpIo6DpWKsJUUlKuVc
Message-ID: <CAC_iWjKRLs4POP3TQ0XrXUiBmW0D5qD0JYh=UxqAytXjPvRmGw@mail.gmail.com>
Subject: Re: [PATCH net-next 3/7] net: netsec: Add metadata support for xdp mode
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>, Sunil Goutham <sgoutham@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	hariprasad <hkelam@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 14:19, Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> Set metadata size building the skb from xdp_buff in netsec driver
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/socionext/netsec.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
> index dc99821c6226fbaece65c8ade23899f610b44a9a..ee890de69ffe795dbdcc5331e36be86769f0d9a6 100644
> --- a/drivers/net/ethernet/socionext/netsec.c
> +++ b/drivers/net/ethernet/socionext/netsec.c
> @@ -970,7 +970,7 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
>                 struct netsec_de *de = dring->vaddr + (DESC_SZ * idx);
>                 struct netsec_desc *desc = &dring->desc[idx];
>                 struct page *page = virt_to_page(desc->addr);
> -               u32 xdp_result = NETSEC_XDP_PASS;
> +               u32 metasize, xdp_result = NETSEC_XDP_PASS;
>                 struct sk_buff *skb = NULL;
>                 u16 pkt_len, desc_len;
>                 dma_addr_t dma_handle;
> @@ -1019,7 +1019,7 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
>                 prefetch(desc->addr);
>
>                 xdp_prepare_buff(&xdp, desc->addr, NETSEC_RXBUF_HEADROOM,
> -                                pkt_len, false);
> +                                pkt_len, true);
>
>                 if (xdp_prog) {
>                         xdp_result = netsec_run_xdp(priv, xdp_prog, &xdp);
> @@ -1048,6 +1048,9 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
>
>                 skb_reserve(skb, xdp.data - xdp.data_hard_start);
>                 skb_put(skb, xdp.data_end - xdp.data);
> +               metasize = xdp.data - xdp.data_meta;
> +               if (metasize)
> +                       skb_metadata_set(skb, metasize);
>                 skb->protocol = eth_type_trans(skb, priv->ndev);
>
>                 if (priv->rx_cksum_offload_flag &&
>
> --
> 2.48.1
>

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

