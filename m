Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 361A762A5F
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2019 22:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731906AbfGHUc7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jul 2019 16:32:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32889 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731883AbfGHUc7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jul 2019 16:32:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id h10so17297478ljg.0
        for <linux-omap@vger.kernel.org>; Mon, 08 Jul 2019 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QmhLmLZUpQw51TcWj6xz/UWa7Fe+O+3V90DXK/aEFco=;
        b=guiXzaD+Q8k8J8Y2zzy+eGlckI4Qfj/1ia32W8QPEpVyDxD+5hgsVF1EBjtMcdA2s/
         5R6J5f6GgfGC+nFAbBkYPeDw/XfsFDCoboRXhsd0sXhsudSf3059LbepmLdXf+bGovGT
         qc6zCll9qpQztznsNGoUo1/z6sIst7IWs3z+Pv7nR02bMmC5DCviI65aoqFu1kzeunE8
         sJFWmex7qjLe3ziuuenXDF2zBUBKL8qpBXz1MQYcrJEwVtkCqsinEygD57Y8dbRhrT+j
         eNRMf0cE5rKvU5kEP5hfxK9mWRVAK1SjUcuMmd409q26ptgM28q5w2oyc86eWpf2IN5O
         UeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=QmhLmLZUpQw51TcWj6xz/UWa7Fe+O+3V90DXK/aEFco=;
        b=MPWEj+DiYoTxdpG8uXBvLcSlWeWePN+xdT7G/zUiV3VtCSsw7A894pwgNF1vikqPfU
         demub3jis/VbE9Pw9XPzvy/ZDEeeeC21kWN9BI4dxyg+4+uWmVP8u9jrw7zFMbkM7/9y
         qpiEYWXxpYi3Fc9L7/JeFSiY5B4a2vXFO9cqXZvUWDuBGozHGe7OlVUm85C0t4tMrTc0
         uXiNujGyEbtAf8I0CmQDksVWoPjdNZ4it5aHCPtij3C1XRy0oZxbmHuDgrnZMNvCFVsU
         cu14av1R6BCk5I3FhKHCCuAXR0QG1io2X0yGcHA4VmrT0Xj4adEV2k7erwPMrc0ChCaM
         Nnhg==
X-Gm-Message-State: APjAAAVHbZARe9nEKXv86ZXnKTfV71Tr8JvmH0ARIBVdpgLPBgsZ/kLd
        CQIZhh9QdwK7DqsndDZnTVP/6Q==
X-Google-Smtp-Source: APXvYqwVRisXI+W1yDsrFdBvfB5lZcfxm6xx+YU6rvWYruaiHxMRpCBIx1t+9hogA9dGSL6dnfZZgQ==
X-Received: by 2002:a2e:981:: with SMTP id 123mr11792658ljj.66.1562617977232;
        Mon, 08 Jul 2019 13:32:57 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id z23sm2925562lfq.77.2019.07.08.13.32.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 13:32:56 -0700 (PDT)
Date:   Mon, 8 Jul 2019 23:32:54 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     David Miller <davem@davemloft.net>
Cc:     grygorii.strashko@ti.com, hawk@kernel.org, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        xdp-newbies@vger.kernel.org, ilias.apalodimas@linaro.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
Subject: Re: [PATCH v8 net-next 0/5] net: ethernet: ti: cpsw: Add XDP support
Message-ID: <20190708203252.GA12580@khorivan>
Mail-Followup-To: David Miller <davem@davemloft.net>,
        grygorii.strashko@ti.com, hawk@kernel.org, ast@kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        xdp-newbies@vger.kernel.org, ilias.apalodimas@linaro.org,
        netdev@vger.kernel.org, daniel@iogearbox.net,
        jakub.kicinski@netronome.com, john.fastabend@gmail.com
References: <20190705150502.6600-1-ivan.khoronzhuk@linaro.org>
 <20190707.183146.1123763637704790378.davem@davemloft.net>
 <20190707.183511.503486832061897586.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190707.183511.503486832061897586.davem@davemloft.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Jul 07, 2019 at 06:35:11PM -0700, David Miller wrote:
>From: David Miller <davem@davemloft.net>
>Date: Sun, 07 Jul 2019 18:31:46 -0700 (PDT)
>
>> From: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
>> Date: Fri,  5 Jul 2019 18:04:57 +0300
>>
>>> This patchset adds XDP support for TI cpsw driver and base it on
>>> page_pool allocator. It was verified on af_xdp socket drop,
>>> af_xdp l2f, ebpf XDP_DROP, XDP_REDIRECT, XDP_PASS, XDP_TX.
>>>
>>> It was verified with following configs enabled:
>>  ...
>>
>> I'm applying this to net-next, please deal with whatever follow-ups are
>> necessary.
>
>Nevermind, you really have to fix this:
>
>drivers/net/ethernet/ti/davinci_cpdma.c: In function ‘cpdma_chan_submit_si’:
>drivers/net/ethernet/ti/davinci_cpdma.c:1047:12: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   buffer = (u32)si->data;
>            ^
>drivers/net/ethernet/ti/davinci_cpdma.c: In function ‘cpdma_chan_idle_submit_mapped’:
>drivers/net/ethernet/ti/davinci_cpdma.c:1114:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>  si.data = (void *)(u32)data;
>            ^
>drivers/net/ethernet/ti/davinci_cpdma.c: In function ‘cpdma_chan_submit_mapped’:
>drivers/net/ethernet/ti/davinci_cpdma.c:1164:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>  si.data = (void *)(u32)data;
>            ^
Actrually that's fixed in reply v9 patch.
But, nevermind, i will send v9 for whole series.

-- 
Regards,
Ivan Khoronzhuk
