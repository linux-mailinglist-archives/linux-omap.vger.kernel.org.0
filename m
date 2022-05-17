Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A94552A180
	for <lists+linux-omap@lfdr.de>; Tue, 17 May 2022 14:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238176AbiEQM17 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 May 2022 08:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236436AbiEQM17 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 May 2022 08:27:59 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F8A47AE1
        for <linux-omap@vger.kernel.org>; Tue, 17 May 2022 05:27:57 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t6so24546162wra.4
        for <linux-omap@vger.kernel.org>; Tue, 17 May 2022 05:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=SoB8yRBkfnY4tC0BVcd9rB6r3zX7qLcPFfWJynagmpU=;
        b=2MOdvGM/vWdg3yKzs5aeZRQ25R3vebTVeCz/r8ls9BcoHtASX041xH5TFXRmKsDq+K
         LMXcsVVt0LvbXMdDum9hJLF8lPuUzoKOwWo34azJ+7+YOutCNQRGIMjJLv1ThF+K11lP
         /1tu4L7Cgk5l/8s0O5XNhCoEj6HgaPhN1FmTNdPKP3IMzDoQrUK4ZmvA78jDB/SygRK6
         E6c4R7ObXwoRL2fluvN4x29CGAA8NP8lnrKtONmOXRGLX51QYZcY0iuHN+afM61k9Xyl
         kiscFHdSZvBKkhR3lQ0LiGgMookejnL+xfqpHmyunHt99RwEKWX1ZpLMS56BEhLE9s7m
         F6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=SoB8yRBkfnY4tC0BVcd9rB6r3zX7qLcPFfWJynagmpU=;
        b=e3LYBm1UmcZSUovD8R8GrrjdC+E2EDLJwyGgzwoB6sTB8qpROhdFzhBmSKBEBzTxeG
         8/m/opVX7+O3KVD1vWftFdK/NmjQ7lZZojscRdJ1KXc9/lRAxjrwBmMBInFM2d8EfQkq
         kcraChX8ivElonIBAS6JBYJLvgKPRwE4pFRM0fFmFPLZl6KUkmwy6nYlSX63ybiZ11Ni
         j61/Vvhtn6w+wGHmyUUqE4DbsoNl0Mc+Qmc4tnqoYe3ZUhtsEYIoMMLxXINuLsZ61onr
         xv+n5c9LH3KAhCgApSrBO5mRnrCnHh17APgUX03R+MPgspqR8TpI++SRHndl8mvu0LMT
         THjw==
X-Gm-Message-State: AOAM53307OhGc3GOj0Yfza2gEBFcK6KfRhCi8FqDdTAHSeS7R3fctGFL
        TU8EvFFvL40Mp7ldanrXkKkv8hxvkIx6obFXU3w=
X-Google-Smtp-Source: ABdhPJy8oLW8YkG/kVlCC3BWamzjDxWp15JdWiA9eppmrjlSqu8HRh9uUvoBDLdZ5V7vgaY0OPQhFQ==
X-Received: by 2002:adf:dc0e:0:b0:20c:8a3f:b523 with SMTP id t14-20020adfdc0e000000b0020c8a3fb523mr18551034wri.201.1652790474941;
        Tue, 17 May 2022 05:27:54 -0700 (PDT)
Received: from [192.168.1.177] ([88.127.185.201])
        by smtp.gmail.com with ESMTPSA id m26-20020a7bce1a000000b003942a244f3fsm1892545wmc.24.2022.05.17.05.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 05:27:54 -0700 (PDT)
Message-ID: <d2af67be-7c71-8428-cffe-7dd012f381a6@baylibre.com>
Date:   Tue, 17 May 2022 14:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] arm64: dts: ti: k3-am625-sk: enable ramoops
Content-Language: en-US
From:   Guillaume LA ROQUE <glaroque@baylibre.com>
To:     linux-omap@vger.kernel.org, nm@ti.com, vigneshr@ti.com
Cc:     praneeth@ti.com, linux-arm-kernel@lists.infradead.org,
        khilman@baylibre.com
References: <20220517122118.2976665-1-glaroque@baylibre.com>
In-Reply-To: <20220517122118.2976665-1-glaroque@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

please ignore, i do typo in commit message...

guillaume

Le 17/05/2022 à 14:21, Guillaume La Roque a écrit :
> Enable ramoops fetures to easily debug some issues.
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> Changes in :
> v3:
> - run dtbs_check
>
> v2:
> - Apply script create-mem_map.py  with args given by Nishanth Menon
> - Spelling fix
> ---
>   arch/arm64/boot/dts/ti/k3-am625-sk.dts | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> index 0de4113ccd5d..62d8503b5923 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> @@ -36,6 +36,15 @@ reserved-memory {
>   		#size-cells = <2>;
>   		ranges;
>
> +		ramoops@9ca00000 {
> +			compatible = "ramoops";
> +			reg = <0x00 0x9ca00000 0x00 0x00100000>;
> +			record-size = <0x8000>;
> +			console-size = <0x8000>;
> +			ftrace-size = <0x00>;
> +			pmsg-size = <0x8000>;
> +		};
> +
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			alignment = <0x1000>;
> --
> 2.25.1
>

