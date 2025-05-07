Return-Path: <linux-omap+bounces-3668-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C9BAAD8F5
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 09:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10151188066D
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 07:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E70220F3C;
	Wed,  7 May 2025 07:49:55 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78720C48A;
	Wed,  7 May 2025 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.2.72.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604195; cv=none; b=JukMrUxzjJh3TLdkOdRV1I/bVZjZdILcWlxhKGx/6ez2kbpz+mPX3cG8AX26D2lSbAxq9ehdRHYzwel5RrYf/HolxVNIG26KwPvFTBp1OfcNxME3OCVV0oKX8L1nEfYrXL1OxKJuu8omRuSrsJ1698A98pdi3zWURCqV1bposME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604195; c=relaxed/simple;
	bh=UkkcMQYBLv3KciShTAVIk1/vTcRrB7rDmhTNevPTtwI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DLQGeCrLiiUF8ZyhjEF9d6TDSh1nDb3mbTrbDDwfx8pJVmYmFgxRcZOAr/T7ZYUtEJ8XR3PQ8HECB+A46RxOcc6RPrI08m1YK7WVPU3kbf1jXNql16+45z+v5U0CVVuJuNc0GlKxhyzG3ICRQOxVwz6mo+ZFr4QUteicm0J9YvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com; spf=pass smtp.mailfrom=mansr.com; arc=none smtp.client-ip=81.2.72.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mansr.com
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
	by unicorn.mansr.com (Postfix) with ESMTPS id 2CA6B15365;
	Wed, 07 May 2025 08:49:51 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id B4AE321A3DA; Wed, 07 May 2025 08:49:50 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tty: serial: 8250_omap: fix tx with dma
In-Reply-To: <d51b4422-0c46-4b03-840b-302603b3136f@kernel.org> (Jiri Slaby's
	message of "Wed, 7 May 2025 08:05:35 +0200")
References: <20250506150748.3162-1-mans@mansr.com>
	<d51b4422-0c46-4b03-840b-302603b3136f@kernel.org>
Date: Wed, 07 May 2025 08:49:50 +0100
Message-ID: <yw1xwmaslv1d.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.4 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Jiri Slaby <jirislaby@kernel.org> writes:

> On 06. 05. 25, 17:07, Mans Rullgard wrote:
>> Commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
>> introduced an error in the TX DMA handling for 8250_omap.
>> When the OMAP_DMA_TX_KICK flag is set, one byte is pulled from the
>> kfifo and emitted directly in order to start the DMA.  This is done
>> without updating DMA tx_size which leads to uart_xmit_advance() called
>> in the DMA complete callback advancing the kfifo by one too much.
>> In practice, transmitting N bytes has been seen to result in the last
>> N-1 bytes being sent repeatedly.
>> This change fixes the problem by moving all of the dma setup after
>> the OMAP_DMA_TX_KICK handling and using kfifo_len() instead of the
>> dma size for the 4-byte cutoff check. This slightly changes the
>> behaviour at buffer wraparound, but it still transmits the correct
>> bytes somehow. At the point kfifo_dma_out_prepare_mapped is called,
>> at least one byte is guaranteed to be in the fifo, so checking the
>> return value is not necessary.
>> Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>> ---
>> v2: split patch in two
>> ---
>>   drivers/tty/serial/8250/8250_omap.c | 24 +++++++++---------------
>>   1 file changed, 9 insertions(+), 15 deletions(-)
>> diff --git a/drivers/tty/serial/8250/8250_omap.c
>> b/drivers/tty/serial/8250/8250_omap.c
>> index f1aee915bc02..180466e09605 100644
>> --- a/drivers/tty/serial/8250/8250_omap.c
>> +++ b/drivers/tty/serial/8250/8250_omap.c
>> @@ -1173,16 +1173,6 @@ static int omap_8250_tx_dma(struct uart_8250_port=
 *p)
>>   		return 0;
>>   	}
>>   -	sg_init_table(&sg, 1);
>> -	ret =3D kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
>> -					   UART_XMIT_SIZE, dma->tx_addr);
>> -	if (ret !=3D 1) {
>> -		serial8250_clear_THRI(p);
>> -		return 0;
>> -	}
>> -
>> -	dma->tx_size =3D sg_dma_len(&sg);
>> -
>>   	if (priv->habit & OMAP_DMA_TX_KICK) {
>>   		unsigned char c;
>>   		u8 tx_lvl;
> ...
>> @@ -1216,11 +1206,12 @@ static int omap_8250_tx_dma(struct uart_8250_por=
t *p)
>>   			goto err;
>>   		}
>>   		skip_byte =3D c;
>> -		/* now we need to recompute due to kfifo_get */
>> -		kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
>> -				UART_XMIT_SIZE, dma->tx_addr);
>>   	}
>>   +	sg_init_table(&sg, 1);
>> +	kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
>> +				     UART_XMIT_SIZE, dma->tx_addr);
>
> This can fail (note the first call to this was checked). The latter
> (deliberately) not.

No, it can't.  The fifo has already been checked to contain something
right at the top of the function.  There is no other failure mode for
kfifo_dma_out_prepare_mapped.

>> +
>>   	desc =3D dmaengine_prep_slave_sg(dma->txchan, &sg, 1, DMA_MEM_TO_DEV,
>>   			DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>>   	if (!desc) {
> ...
>> @@ -1248,8 +1240,10 @@ static int omap_8250_tx_dma(struct uart_8250_port=
 *p)
>>   err:
>>   	dma->tx_err =3D 1;
>>   out_skip:
>> -	if (skip_byte >=3D 0)
>> +	if (skip_byte >=3D 0) {
>>   		serial_out(p, UART_TX, skip_byte);
>> +		p->port.icount.tx++;
>
> This is still unrelated.

No, it's not.  Your broken code called uart_xmit_advance with the full
amount due to the incorrect tx_size value.  This compensates for that.

You made this mess.  Now fix it.  I don't care how.  It's wasted enough
of my time already.

--=20
M=E5ns Rullg=E5rd

