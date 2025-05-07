Return-Path: <linux-omap+bounces-3669-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B6AAD9C9
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 10:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 926D01C0028E
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 08:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A987C223DE1;
	Wed,  7 May 2025 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQxO6eTi"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D337223DC3;
	Wed,  7 May 2025 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605396; cv=none; b=MBxETp5g7KgPxwvqPADsc5YbY+rwAweWA60PcCCFpZaCJA4ok7JADdZ7CaiSRLX143c1Jc+i9OckYqow/vmrnL/6HtCDY9nBu9wkL6bGiAeoGdkWxSOLS8jSIyb4kyru9/YPySRLe/Xs2m1wp00dfDtpettXn5Bl/GdzamGWvtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605396; c=relaxed/simple;
	bh=5WwtVopCHqR3nPs2H/TCDgs6bsVAlKnKxjT1ioZpkPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQqDbEmk463OU/RUDLb0mmYwEUmoByBuVqwib8nFmTtnwZHHE8JViX8H2q9NGa5HRkDi3F2NbXLkc+GHG/GqlrunEACWyiQ0tv4+wepjHvBwH5+WsO5dRQt+JEUA2vzG74pafe9Tk7SuEn4cTOLt3028JCIHux1mNSNV3eB16YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQxO6eTi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703FBC4CEE7;
	Wed,  7 May 2025 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746605395;
	bh=5WwtVopCHqR3nPs2H/TCDgs6bsVAlKnKxjT1ioZpkPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aQxO6eTixwXV70JgUn7lR33CLPGyfy5PGWW7gjptF8/nxR6DQ8XNPWR3qwHDVg20Z
	 FnlhAa4U1a0lfOiCdIVzePI6W9jbxl/bcrNlLUtzxlrmQJexoMa3Jdz/JJUuuVrcW8
	 bVp95fJWWGaZRjuuIN0cIGD+TRChZ1LgZ96Y+w77a+7y7X/W1rUf38+An4NhSqRiIh
	 F3ZEEXQCFLjuQ94Qur4G+2vUQAB9Ik4MEvJOmsme5d9g+WlPkuPUNfAKtUz5IdPKb/
	 E70tHWdx/zdKKN2xKtLg04fiEtw7yT4pIoNi0f+MfiYdAs4+PbuMyxu7OI8UGRZpzw
	 6Xd3RiKjZbPRw==
Message-ID: <14d13f9b-77db-4545-97d1-bc36abcb9644@kernel.org>
Date: Wed, 7 May 2025 10:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tty: serial: 8250_omap: fix tx with dma
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
 stable@vger.kernel.org
References: <20250506150748.3162-1-mans@mansr.com>
 <d51b4422-0c46-4b03-840b-302603b3136f@kernel.org>
 <yw1xwmaslv1d.fsf@mansr.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <yw1xwmaslv1d.fsf@mansr.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07. 05. 25, 9:49, Måns Rullgård wrote:
> Jiri Slaby <jirislaby@kernel.org> writes:
> 
>> On 06. 05. 25, 17:07, Mans Rullgard wrote:
>>> Commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
>>> introduced an error in the TX DMA handling for 8250_omap.
>>> When the OMAP_DMA_TX_KICK flag is set, one byte is pulled from the
>>> kfifo and emitted directly in order to start the DMA.  This is done
>>> without updating DMA tx_size which leads to uart_xmit_advance() called
>>> in the DMA complete callback advancing the kfifo by one too much.
>>> In practice, transmitting N bytes has been seen to result in the last
>>> N-1 bytes being sent repeatedly.
>>> This change fixes the problem by moving all of the dma setup after
>>> the OMAP_DMA_TX_KICK handling and using kfifo_len() instead of the
>>> dma size for the 4-byte cutoff check. This slightly changes the
>>> behaviour at buffer wraparound, but it still transmits the correct
>>> bytes somehow. At the point kfifo_dma_out_prepare_mapped is called,
>>> at least one byte is guaranteed to be in the fifo, so checking the
>>> return value is not necessary.
>>> Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>>> ---
>>> v2: split patch in two
>>> ---
>>>    drivers/tty/serial/8250/8250_omap.c | 24 +++++++++---------------
>>>    1 file changed, 9 insertions(+), 15 deletions(-)
>>> diff --git a/drivers/tty/serial/8250/8250_omap.c
>>> b/drivers/tty/serial/8250/8250_omap.c
>>> index f1aee915bc02..180466e09605 100644
>>> --- a/drivers/tty/serial/8250/8250_omap.c
>>> +++ b/drivers/tty/serial/8250/8250_omap.c
>>> @@ -1173,16 +1173,6 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>>>    		return 0;
>>>    	}
>>>    -	sg_init_table(&sg, 1);
>>> -	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
>>> -					   UART_XMIT_SIZE, dma->tx_addr);
>>> -	if (ret != 1) {
>>> -		serial8250_clear_THRI(p);
>>> -		return 0;
>>> -	}
>>> -
>>> -	dma->tx_size = sg_dma_len(&sg);
>>> -
>>>    	if (priv->habit & OMAP_DMA_TX_KICK) {
>>>    		unsigned char c;
>>>    		u8 tx_lvl;
>> ...
>>> @@ -1216,11 +1206,12 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>>>    			goto err;
>>>    		}
>>>    		skip_byte = c;
>>> -		/* now we need to recompute due to kfifo_get */
>>> -		kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
>>> -				UART_XMIT_SIZE, dma->tx_addr);
>>>    	}
>>>    +	sg_init_table(&sg, 1);
>>> +	kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
>>> +				     UART_XMIT_SIZE, dma->tx_addr);
>>
>> This can fail (note the first call to this was checked). The latter
>> (deliberately) not.
> 
> No, it can't.  The fifo has already been checked to contain something
> right at the top of the function.  There is no other failure mode for
> kfifo_dma_out_prepare_mapped.

That it cannot fail now does not mean it cannot in the future. Simply do 
it properly and check the retval.

>>> +
>>>    	desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1, DMA_MEM_TO_DEV,
>>>    			DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>>>    	if (!desc) {
>> ...
>>> @@ -1248,8 +1240,10 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
>>>    err:
>>>    	dma->tx_err = 1;
>>>    out_skip:
>>> -	if (skip_byte >= 0)
>>> +	if (skip_byte >= 0) {
>>>    		serial_out(p, UART_TX, skip_byte);
>>> +		p->port.icount.tx++;
>>
>> This is still unrelated.
> 
> No, it's not.  Your broken code called uart_xmit_advance with the full
> amount due to the incorrect tx_size value.  This compensates for that.

Then document it properly in the commit log.

> You made this mess.

I can only say that I am sorry for the breakage of this driver. This TX 
way with one byte via FIFO and the rest via DMA, and only if > 4 chars 
to be sent is indeed cumbersome and apparently uneasy to do right.

> Now fix it.  I don't care how.  It's wasted enough
> of my time already.

How exactly does this help to get the code in shape? You apparently have 
the HW, you spent some time debugging that, you have patches, so you 
deserve the credits.

thanks,
-- 
js
suse labs

