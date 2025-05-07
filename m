Return-Path: <linux-omap+bounces-3667-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B31AAD5A6
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 08:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3765501EF3
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 06:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20AB1FBC91;
	Wed,  7 May 2025 06:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xydg6riZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A513209;
	Wed,  7 May 2025 06:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597939; cv=none; b=pC8hmZo1kE22gs9lcDn8dHxSthmKYPNTczEHAakJVtU7JsjZx20oPdU1KOJd4uAa3y2/tjOwaoKlNtmd9KgYZMGXNuF3W8LX41S7Y5qO7ep+AN1buzxROazPDnmWCmBoGFgyXU6mEqP2vtTIizrgtDmQSymAICMBX7IMxArNOOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597939; c=relaxed/simple;
	bh=MxaitG3CeVKWMYfeMyrLf5dhe0p3NY2WKRP6bXurY4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/Cjk0PkbzCpFolxhI+/ucO1Tnz6uuo8t88jUjJCuaTqYNysfYc3x1cGWaFWnX4yS6srNK2pvaujPYBXlIRUP9aGxt/PXwZDqau8Y1wfc3vUfawqRXRI/xl13Wu8azj6lQWYO75PlNcIyoufd9f5gV8KndvmuXCmahqWsbWdDxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xydg6riZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927D5C4CEE7;
	Wed,  7 May 2025 06:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746597938;
	bh=MxaitG3CeVKWMYfeMyrLf5dhe0p3NY2WKRP6bXurY4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xydg6riZZiopOfjrEFs9cFM5vjxkDdxaMx26gHeyNlsv+htBqzNyK7TVu8UV47g/W
	 FyiB8SBP7pt7G4J8OkZgHtZmi96TDgsuoZAouple+rlD9GrEqkguTWHMr2DbhbSxX4
	 9gAxC2ZFcu4W783A17jlYjR/ObGNRnbN0QZ0S1BN3qRHsZa3YxFFBTiOwHlYxoGPyr
	 t41ThI81r1N88XNZ6lUB1DJp6DQxNkv6LxFKj77YtSa7H8gWLPG+ANoy04+v4wukif
	 C1jtgshJvfUr5cTyxig5zIyf/uRaD40LVREPv1kz+Wm8qi+E6BnD7uZuOXzSnAcPlv
	 DzZXeYATjqonA==
Message-ID: <d51b4422-0c46-4b03-840b-302603b3136f@kernel.org>
Date: Wed, 7 May 2025 08:05:35 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tty: serial: 8250_omap: fix tx with dma
To: Mans Rullgard <mans@mansr.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
 stable@vger.kernel.org
References: <20250506150748.3162-1-mans@mansr.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250506150748.3162-1-mans@mansr.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06. 05. 25, 17:07, Mans Rullgard wrote:
> Commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
> introduced an error in the TX DMA handling for 8250_omap.
> 
> When the OMAP_DMA_TX_KICK flag is set, one byte is pulled from the
> kfifo and emitted directly in order to start the DMA.  This is done
> without updating DMA tx_size which leads to uart_xmit_advance() called
> in the DMA complete callback advancing the kfifo by one too much.
> 
> In practice, transmitting N bytes has been seen to result in the last
> N-1 bytes being sent repeatedly.
> 
> This change fixes the problem by moving all of the dma setup after
> the OMAP_DMA_TX_KICK handling and using kfifo_len() instead of the
> dma size for the 4-byte cutoff check. This slightly changes the
> behaviour at buffer wraparound, but it still transmits the correct
> bytes somehow. At the point kfifo_dma_out_prepare_mapped is called,
> at least one byte is guaranteed to be in the fifo, so checking the
> return value is not necessary.
> 
> Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
> v2: split patch in two
> ---
>   drivers/tty/serial/8250/8250_omap.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> index f1aee915bc02..180466e09605 100644
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -1173,16 +1173,6 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>   		return 0;
>   	}
>   
> -	sg_init_table(&sg, 1);
> -	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
> -					   UART_XMIT_SIZE, dma->tx_addr);
> -	if (ret != 1) {
> -		serial8250_clear_THRI(p);
> -		return 0;
> -	}
> -
> -	dma->tx_size = sg_dma_len(&sg);
> -
>   	if (priv->habit & OMAP_DMA_TX_KICK) {
>   		unsigned char c;
>   		u8 tx_lvl;
...
> @@ -1216,11 +1206,12 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>   			goto err;
>   		}
>   		skip_byte = c;
> -		/* now we need to recompute due to kfifo_get */
> -		kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
> -				UART_XMIT_SIZE, dma->tx_addr);
>   	}
>   
> +	sg_init_table(&sg, 1);
> +	kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
> +				     UART_XMIT_SIZE, dma->tx_addr);

This can fail (note the first call to this was checked). The latter 
(deliberately) not.

> +
>   	desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1, DMA_MEM_TO_DEV,
>   			DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>   	if (!desc) {
...
> @@ -1248,8 +1240,10 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>   err:
>   	dma->tx_err = 1;
>   out_skip:
> -	if (skip_byte >= 0)
> +	if (skip_byte >= 0) {
>   		serial_out(p, UART_TX, skip_byte);
> +		p->port.icount.tx++;

This is still unrelated.

thanks,
-- 
js
suse labs

