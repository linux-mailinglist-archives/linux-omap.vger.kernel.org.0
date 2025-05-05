Return-Path: <linux-omap+bounces-3639-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2E9AA9241
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 13:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4586518956B5
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 11:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613712063F0;
	Mon,  5 May 2025 11:43:40 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F71F4C9B;
	Mon,  5 May 2025 11:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445420; cv=none; b=kgKFL6GVKXSO8XXtwf6VX+SYZ47mZlMUH7DJB/erupL78kVXmkXinEGntvIm93Ef1Dq6viphl3oFjjK2Z5eMvf612/bjlV04ZIWaw0r+xdr0Th/TEdn+xGz77RJlJvFSn6AlEaQd3kyHs4g6SzUeZXcSJTebOBwu5QOTw8pP+ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445420; c=relaxed/simple;
	bh=LroyPHP++7p+Vgslel/c4KZw8fDFrIhu9uNkaYu9lRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgiR4dy3T1Dqg3GodFkqu8xD4ayl3yd1QpLcN4usvhgD9lF6QtRvKjVg2KN9DEnPmsfpL1WjVHi8LDhc4ssDuzd9+/vJwjWCrJ7FubO15PRWS/Wvh4LCrg8LEGGUzHcrogbnfarS0tMqi03BkmDIhTl0B/sDKWraqjtzZS0OG2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-877c46ab075so778921241.3;
        Mon, 05 May 2025 04:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445415; x=1747050215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAF5arAbrcK4xPOLwu1J3gN7QYwL2MYYXKtYUP5/0f0=;
        b=RPrB9n7I3s5XlngBfob6hI4Zl4I2I7Cv/5ES6Wdc6QAAMgf2sJymAHA6Z+HNTOIdGq
         /JljKt0xI3o0fgfj2X7IE8N8B4V6qpYrYAziACgzTfkmbcUC+jBgAj1ZrGd1CGFSdv5M
         S7HTm60hvCOcmRQkMjr4n6S4If1w7hiFZzarU5EfCNrrQTBr+rk0RrFiUk4ZNUGfu8Pc
         Kic5kBZSY6FxYF+XSjgGpYjZnNUA3xb+SpNd0ToLgVK+HGqBUDnRP9LOYVHnhzT4NyYR
         MBMoIPMYpQp5h7xsqn7pmix/AZE6W3Qy7UBZn7z37YaI+ww78CC9cnGVJAJLWGMqKKpf
         zUFA==
X-Forwarded-Encrypted: i=1; AJvYcCUI5+X3WugQgb5CJvc14As0MR30/rwOPfbPksfvTU4OKS+OJn96SkOGu0YiFzPAXGfHJgrGXaTHFi2bZQ==@vger.kernel.org, AJvYcCW+XSmmfIQ/v33GfgyOfhrKgH29WxP82o8yCelb7a22W6IsxmuShzUeKebfS81bX9W2CkxvtHNia0xZDh8=@vger.kernel.org, AJvYcCWEDubAwjbXIA+h+tWjMlFzJ9BojBkThvJ1vM73vuQxrFBv6QYdvKGEVksZwj7t2WELVtN5WntzXyfiuFBb@vger.kernel.org
X-Gm-Message-State: AOJu0YzpuTYrr0WkuNwtNPcbZYuOPHwAJ3f+dQ2kpqZ05T2rH1ALajFf
	KIrr5WvBpW9PnwgBis4/h+gNEOdXUqFSOxVr6QzhfpZktnP2Po79T18TE+GA
X-Gm-Gg: ASbGncs8EgHQSSPg4BxEiwvECIYjhZ6GjaJcIIzWUEBJgSJQ7zLdrutJbTB78qi07gG
	DUdRnmStKkUvH0dIHAJe3Kt7eG2z5kY9elqbvXQUiTp0RWGOlkezrJZjqpSUq352L3VGz17vwbD
	cyZlnSThRyJpVoSXPBU6Q6YR0Rv1ML5OrZQXwBDmYlN44iFHTTSBPzo2XJAq6TojC7q/YM4j/3n
	W9PuQO/QUmwxT+TLy7GBEk4OFxGvUDdIKxPJ3BqS6a4Rd/NcVGmnCh6nTVRU7GKMxQ7LxNc8FT2
	OrUD+nKGAd8Q2Iv1FXGL6WnjQZzFT1irTBwZGO/LfO50lzqquPgauxJhFfQ3MuA1ybXwTdhB8G+
	0EKI=
X-Google-Smtp-Source: AGHT+IE7IJ7bv2yj/LcpTrbexPVvKOMqsxHuGF52MSdoIwREL0t7RWCf15deqDhebcghDqBukIaFQg==
X-Received: by 2002:a05:6102:4a95:b0:4da:e629:58c5 with SMTP id ada2fe7eead31-4db0c42b114mr4244571137.23.1746445415332;
        Mon, 05 May 2025 04:43:35 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780b09bc00sm1246606241.27.2025.05.05.04.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:43:34 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-877c46ab075so778907241.3;
        Mon, 05 May 2025 04:43:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVROFjN4iybKFHDyGE/K15obyL/cPfyvLhk/YT14CiqVHRC5gyiXmtB/X5+xWqC5qvM7DGaoFGVsNJLNl8u@vger.kernel.org, AJvYcCVfy8lPJ8tnMBa9rH4gXGunRU9Y4/t69cGM4XcoqWI1wnkC/nAUdyniy/EXWVwMMWJjkrFpo4bzssqcPRk=@vger.kernel.org, AJvYcCXen6Yrt3Zq2x1an98TtcAaWmLRdDAIQ8G6H45dVNxvz3/gJR1Qd18XKXte/E6v9Y0qQ7oFV+9N2w1tbA==@vger.kernel.org
X-Received: by 2002:a05:6102:2c85:b0:4c5:1bea:1c29 with SMTP id
 ada2fe7eead31-4db0c3de40cmr4336025137.19.1746445414091; Mon, 05 May 2025
 04:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430163709.15850-1-mans@mansr.com>
In-Reply-To: <20250430163709.15850-1-mans@mansr.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 13:43:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUrQjcb7mqTo0EOEDWFSaK3j-_3sumLTjoDEnP8qTvakg@mail.gmail.com>
X-Gm-Features: ATxdqUHBwbolkuQR-MXBj2JzT0P9vufOLogqeqtvnB3CPASb942XHDr6Mh4LOhU
Message-ID: <CAMuHMdUrQjcb7mqTo0EOEDWFSaK3j-_3sumLTjoDEnP8qTvakg@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: 8250_omap: fix tx with dma
To: Mans Rullgard <mans@mansr.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"

CC omap

On Wed, 30 Apr 2025 at 18:45, Mans Rullgard <mans@mansr.com> wrote:
> Commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
> introduced two errors in the TX DMA handling for 8250_omap.
>
> Firstly, kfifo_dma_out_prepare_mapped() needs a scatterlist with two
> entries whereas only one is provided.  The same error was fixed for
> 8250_dma in 59449c9dbdaa ("tty: serial: 8250_dma: use sgl with 2 nents
> to take care of buffer wrap").
>
> Secondly, when the OMAP_DMA_TX_KICK flag is set, one byte is pulled from
> the kfifo and emitted directly in order to start the DMA.  This is done
> without updating DMA tx_size which leads to uart_xmit_advance() called
> in the DMA complete callback advancing the kfifo by one too much.
>
> In practice, transmitting N bytes has been seen to result in the last
> N-1 bytes being sent repeatedly.
>
> This change fixes both problems.
>
> Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  drivers/tty/serial/8250/8250_omap.c | 35 +++++++++++++++--------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> index f1aee915bc02..84a2f013015e 100644
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -1152,9 +1152,11 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>         struct omap8250_priv            *priv = p->port.private_data;
>         struct tty_port                 *tport = &p->port.state->port;
>         struct dma_async_tx_descriptor  *desc;
> -       struct scatterlist sg;
> +       struct scatterlist *sg;
> +       struct scatterlist sgl[2];
>         int skip_byte = -1;
>         int ret;
> +       int i;
>
>         if (dma->tx_running)
>                 return 0;
> @@ -1173,16 +1175,6 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>                 return 0;
>         }
>
> -       sg_init_table(&sg, 1);
> -       ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
> -                                          UART_XMIT_SIZE, dma->tx_addr);
> -       if (ret != 1) {
> -               serial8250_clear_THRI(p);
> -               return 0;
> -       }
> -
> -       dma->tx_size = sg_dma_len(&sg);
> -
>         if (priv->habit & OMAP_DMA_TX_KICK) {
>                 unsigned char c;
>                 u8 tx_lvl;
> @@ -1207,7 +1199,7 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>                         ret = -EBUSY;
>                         goto err;
>                 }
> -               if (dma->tx_size < 4) {
> +               if (kfifo_len(&tport->xmit_fifo) < 4) {
>                         ret = -EINVAL;
>                         goto err;
>                 }
> @@ -1216,12 +1208,19 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>                         goto err;
>                 }
>                 skip_byte = c;
> -               /* now we need to recompute due to kfifo_get */
> -               kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
> -                               UART_XMIT_SIZE, dma->tx_addr);
>         }
>
> -       desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1, DMA_MEM_TO_DEV,
> +       sg_init_table(sgl, ARRAY_SIZE(sgl));
> +
> +       ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, sgl, ARRAY_SIZE(sgl),
> +                                          UART_XMIT_SIZE, dma->tx_addr);
> +
> +       dma->tx_size = 0;
> +
> +       for_each_sg(sgl, sg, ret, i)
> +               dma->tx_size += sg_dma_len(sg);
> +
> +       desc = dmaengine_prep_slave_sg(dma->txchan, sgl, ret, DMA_MEM_TO_DEV,
>                         DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>         if (!desc) {
>                 ret = -EBUSY;
> @@ -1248,8 +1247,10 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>  err:
>         dma->tx_err = 1;
>  out_skip:
> -       if (skip_byte >= 0)
> +       if (skip_byte >= 0) {
>                 serial_out(p, UART_TX, skip_byte);
> +               p->port.icount.tx++;
> +       }
>         return ret;
>  }
>
> --
> 2.49.0

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

