Return-Path: <linux-omap+bounces-3412-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E602BA670E4
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 11:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 134631885718
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 10:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75B7207A1F;
	Tue, 18 Mar 2025 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVKVLCoK"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F95204F97
	for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292829; cv=none; b=rX8lGa/tmOXvI1pBXHar9uBHWpE4aO189N2gTvm5Ec6XlzNrNOFHafnyNO960t2kYZ75w8xEiVyg8f3+MA0l2370WPrgpYmG07Q4qvTR/tiVllQ55RVj7PUm6LSoX3DayS1pl8sgZa32WfR9L62LMVxNIn0PcoUXBtWQ1OtwOSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292829; c=relaxed/simple;
	bh=bTXyPUX/nTogcTrzO4w+0DnzKj6GcEsE6zMX5lpp/T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXqoG5Uo05PLYJzlanrDjmHKVQyITsdovddVyU9Fy0pd5MGKpR75Iqdy22TMc0u5iaihU2+dTBkBO+7mbX/TjTG3Mz/CVV3CyW3+RfVqbVxWLVpmSIf5aX/cYo3EXLjJBc+agjVKAFgEyL2I2lHdZ0FPENd87jjU6OR1v2OY2Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVKVLCoK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742292823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTXyPUX/nTogcTrzO4w+0DnzKj6GcEsE6zMX5lpp/T8=;
	b=UVKVLCoKSWPcum5AUnGXMhNjm7rv818Ih/1q4WfL+d4JApQQezySNiYCGxKHJ3Tw6ueQP/
	seFTIHqwFGb3Snc2j/kBqmI+wraKx+dXwuCzGBwVY5Wuk1JvbkR+kH6w6IQryOchv8CgNz
	+RtLkbrzSJ/PITfKLCmFmoHCrdXawEM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-jbsmkxPIN5y2jMSUXcPtow-1; Tue, 18 Mar 2025 06:13:25 -0400
X-MC-Unique: jbsmkxPIN5y2jMSUXcPtow-1
X-Mimecast-MFC-AGG-ID: jbsmkxPIN5y2jMSUXcPtow_1742292804
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so19101265e9.3
        for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 03:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292804; x=1742897604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTXyPUX/nTogcTrzO4w+0DnzKj6GcEsE6zMX5lpp/T8=;
        b=rK2HJFZzawNayad50f1DbBVifXKvonnUM9kzbR0OqASrsXwwYvBF1OI+fUMcPTeZo/
         5qk6sGsSZu365FlczpOn70ImIpyV1MHT/2SQtg7i2wQab7S14h+ZCxFHCmh37iUyaPg5
         PlQ/ofYiMnj5I3q4piCLqN9jP4CE2RwPQ02Zy7Xw5JGH3hnYnvYF6/DGsIWy80VAzg74
         DpvO1FeH5X2RwRP7Ei05ynT8StLfLV2CYse80WXd9HyWhSlTiBtY79qnzP5WdwE3OUKz
         7Zjljhwy4M476Ll+5PZg4OVoyd1fbM4+1/D2beXxW7uJJjeqf71kPNDXYjIDqCXvk1UJ
         eRwA==
X-Forwarded-Encrypted: i=1; AJvYcCWzkVrN9JFe6vUq5qrVvkS6Yh9s02h6K/KRBU4i1mpaGFV4P7JB3g8m/mYgim0JsoFD4GQKwB1XR5o5@vger.kernel.org
X-Gm-Message-State: AOJu0YztXOHIpJjtGm2XwYf8tkCEX7qHwD7mGoYbhzgRtk+1w5tVaPtF
	lSdiVLoRf19Apm/jVwfSRzjoDcgG3CFoU0k6b+wlDL/XXMxjLcoaFaXHwAn3ZdxpWUxzCKqfkI4
	orFgWskyAkUcO4eNiqEnbIGtN78xwWyILlRv3KaZQ2AE6kaEqED65od/OSXs=
X-Gm-Gg: ASbGnctFfLDJ3YXtK7MEa9bE4+ix6ayyfzDXgI1Hj3bY5Au9/1q8WRaYHPS/aWaImSg
	w0WKhaSSbTBDUMK9fIPzDKgAAMtR+Q0MjcN7RE8Ioko6gNiEkMi833mEQB0NcRSPYyw4q/Lgjl5
	xdq/x1M5YemrlaFNZFxLdhawzRVqdUIV9rVZebipQFzIND7C7I6f2WUU7vq4ZKt9l7shxwGOUv6
	496LcxCUIfYHBR0Q/GCC2Oekp81M3VZL0/v0r7zjKYtHjeviaH4+Ru7cXlQfQ9r7+uShXhRRwEk
	derZfn/x5RVOyi/SqxYD8OtHtlTYD2g2nx+B2ODg7b1WFQ==
X-Received: by 2002:a05:600c:5112:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43d3b9cd704mr14645035e9.19.1742292804457;
        Tue, 18 Mar 2025 03:13:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa2x79C78ENEoyzPPniqeGCkHBce2M9I0jdc1yv0/RSaEENBZYufXun9PO4beIARs4YqnHHQ==
X-Received: by 2002:a05:600c:5112:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43d3b9cd704mr14644695e9.19.1742292804010;
        Tue, 18 Mar 2025 03:13:24 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe609dasm129105475e9.28.2025.03.18.03.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:13:23 -0700 (PDT)
Message-ID: <6259af5f-f518-4f88-ada9-31c3425ce6ed@redhat.com>
Date: Tue, 18 Mar 2025 11:13:20 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/7] net: xdp: Add missing metadata support for
 some xdp drvs
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org
References: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/11/25 1:18 PM, Lorenzo Bianconi wrote:
> Introduce missing metadata support for some xdp drivers setting metadata
> size building the skb from xdp_buff.
> Please note most of the drivers are just compile tested.

I'm sorry, but you should at very least report explicitly on per patch
basis which ones have been compile tested.

Even better, please additionally document in each patch why/how the
current headroom is large enough.

Thanks,

Paolo


