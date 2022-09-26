Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A7B5EB309
	for <lists+linux-omap@lfdr.de>; Mon, 26 Sep 2022 23:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiIZVVf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Sep 2022 17:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiIZVVe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Sep 2022 17:21:34 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F3A72B73
        for <linux-omap@vger.kernel.org>; Mon, 26 Sep 2022 14:21:33 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id i6so3759905pfb.2
        for <linux-omap@vger.kernel.org>; Mon, 26 Sep 2022 14:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date;
        bh=BLiXT9e+VR3LiHB90CPkTU3h/SZjwM3pjBzHenM7MCU=;
        b=UfVu2i/J+fNOk8okkcbwTzspMPIt9OuB3YdGtKxrCgEjOAgFJklkXceqPa4xC9/RQG
         gz3bTTay8Hf0HLvZpPg6qY1l2uDeOUPT04+9zUK6R9i7IIXAy/tyZQ485IvF4qtkG+lH
         IczabqsA3YOWLmqrZE/1FrrZODJ+Ov+wS/TDO1sLY9eIYQVSZNJucW9koKSInbKyZFP/
         l5fejRvFpmejKizyCoPgxU9+iKg2gH4ADQ+QjgcEg0zMrKD8RnRioFhqrD7YMj8ZrErB
         /MrCWjOoSck4duu419o3oN+5l9KGEkKB86xA3nTF8fzjy5NGX1nqAzih14MtIb9X0f81
         BrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BLiXT9e+VR3LiHB90CPkTU3h/SZjwM3pjBzHenM7MCU=;
        b=w54jyruvwrY2Y6GAOBoh797YF6+tK8jA0aG9p26Vq+8WT5hZDYYucHR7P3LAld0+J1
         tlw7gmZLt/8tZN/4+oVAvjaRvJTBz/BH0N8oInDsh+cQvCuEze58EShPBG++XddZPMrA
         AcdHD+PO86P5SbRbfOsEBCbzIJc87I2+9Mi6lcu5y5sqp3r0tOSwfTWj4SY4HqKLMIfV
         FBd71CVe414pjhuPXEcA5he2b81QWM7L50rJnX2yhQEC/uenHGq2kz2Dp4Wc59epfxjh
         SkxC+l7DoIGIGPaMbs/rX6wrmYMiaelu1au/IMI4F2EraYXcCXb8XQoMBqeLweicite3
         8EZQ==
X-Gm-Message-State: ACrzQf3qrx0D+QRTYgYsFgkC4Gj5AP3Y9rPDIpzyXT0612vT1lp1hqSM
        5CTu8ysi+Gy/0RbJQynQ7qqmJw==
X-Google-Smtp-Source: AMsMyM4EKROnJt2dlHLXeul9Q7tdMVk4pgHf+2koE7cTh85ugWyGNTLQ153bxuxO+UBEJsRoGCbs3w==
X-Received: by 2002:a62:17d1:0:b0:54d:87d5:249e with SMTP id 200-20020a6217d1000000b0054d87d5249emr25769255pfx.14.1664227293302;
        Mon, 26 Sep 2022 14:21:33 -0700 (PDT)
Received: from localhost ([76.146.1.42])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709027e4900b00177e263303dsm11727371pln.183.2022.09.26.14.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 14:21:32 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     =?utf-8?Q?P=C3=A9ter?= Ujfalusi <peter.ujfalusi@gmail.com>,
        dmaengine@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nicolas Frayer <nfrayer@baylibre.com>
Subject: Re: [PATCH 0/3] dma/ti: enable udma and psil to be built as modules
In-Reply-To: <cf3194ec-0952-fa7a-cc05-6a60e7e66cf0@gmail.com>
References: <20220926181848.2917639-1-khilman@baylibre.com>
 <cf3194ec-0952-fa7a-cc05-6a60e7e66cf0@gmail.com>
Date:   Mon, 26 Sep 2022 14:21:31 -0700
Message-ID: <7h7d1pg7c4.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi P=C3=A9ter,

P=C3=A9ter Ujfalusi <peter.ujfalusi@gmail.com> writes:

> On 9/26/22 21:18, Kevin Hilman wrote:
>> Enable the UDMA driver & glue and PSIL maps to be built & loaded as modu=
les.
>>=20
>> The defauilt Kconfig settings are not changed, so default upstream is
>> still to be built in.  This series just enables the option to build as
>> modules.
>
> I can finally drop the half backed stuff I roll on top of -next ;)
>
> Do you plan to convert the ringacc also? It is straight forward, like:
> https://github.com/omap-audio/linux-audio/commit/01f9290c1c61e8bbc0fbdd87=
7382672883ba7e73

Yes, my colleague Nicolas (cc'd) was planning ringacc shortly, but we
didn't realize you had already don it.  Your version looks fine to me.
Any reason not to submit yours?

Kevin
