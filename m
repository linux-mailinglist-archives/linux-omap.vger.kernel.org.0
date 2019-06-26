Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B38255E26
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 04:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfFZCRo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 22:17:44 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:45938 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfFZCRo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 22:17:44 -0400
Received: by mail-yw1-f66.google.com with SMTP id m16so296760ywh.12
        for <linux-omap@vger.kernel.org>; Tue, 25 Jun 2019 19:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oKNSTMowmRk3RkH/jcMvNDg+7Zu5bOsgngVeZGPE5Q8=;
        b=eY0A99wxkmneSw3ebBgb5whYrrPrAoGKxDfaWS3HcYMmutSOo1BH8nElIh41fZwBcD
         NwbVKrWfUvloOlQBGbMYUmhlFpV0RDV3KTes3kOXeIVwySVLujVm4OtqFcre7KKpfq/R
         D7G7dqEy6MSdABObz7svw3zakl/5/mjk7tvkyvGIWAA/cbwPg+//VTklgB0tRo1JkbFm
         7xkZFduPNqi/xRZSkxAx9H4pVVa24jOalHkwUs3GJGqmBtCST7x2tR0RXkBwf/ylqVuf
         IVXxxVoWHNndpMXYBHfCH/0w8BLAZzQ1S2BJ1yjwfCRh9Hmv9akNOAelzJl8IEVCY7xD
         uePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oKNSTMowmRk3RkH/jcMvNDg+7Zu5bOsgngVeZGPE5Q8=;
        b=Fg8JW4DzmqA+UDjHKzDt+VZWohzORW6xuabYqos10+UPoJVoNJK/X0evVbU3zHvgJW
         o79qrwDMSVl7k7FOvV3CsMl1c2BnH0OnoCbr14L1gK+rn80H8nybgnidH6JULFFIYFBW
         /Hv90QSkO2pL16NszrYYarraqzRwyXhIBHe/rZrzULTcwqVdT/Ce9GNtjrAh+fdHKRbZ
         Y5Cp6mDGyY4tk8KkdMgKefy/gCoSPfqPIMcynvxqnfFBLqMTr4erwXsN4rVETrlis0K3
         rQse6MT+DZiRo1+dam9tXMI3z0+q2hhAk8O1a6Bvm1GibZjf5LswPUfl4jFHvizgsfwl
         GbPA==
X-Gm-Message-State: APjAAAUi0t49ooAUssEc8vOjlHUWpSOGa/qArYw6D9LvDuSlMP/f/P/z
        hDAz+wNJE8py9gU+dOsHgSre/ei+
X-Google-Smtp-Source: APXvYqzhRGzzPjU3XN7atW9aXKV5GC6ze67TKgkmdQJ3FTudI70MgW3nk+9kv9ZfnO7nirUOYJSW0g==
X-Received: by 2002:a81:a55:: with SMTP id 82mr1194230ywk.205.1561515462638;
        Tue, 25 Jun 2019 19:17:42 -0700 (PDT)
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id v9sm635252ywg.73.2019.06.25.19.17.41
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 19:17:41 -0700 (PDT)
Received: by mail-yw1-f54.google.com with SMTP id u134so313355ywf.6
        for <linux-omap@vger.kernel.org>; Tue, 25 Jun 2019 19:17:41 -0700 (PDT)
X-Received: by 2002:a81:7882:: with SMTP id t124mr1124280ywc.494.1561515461099;
 Tue, 25 Jun 2019 19:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190625175948.24771-1-ivan.khoronzhuk@linaro.org> <20190625175948.24771-4-ivan.khoronzhuk@linaro.org>
In-Reply-To: <20190625175948.24771-4-ivan.khoronzhuk@linaro.org>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Tue, 25 Jun 2019 22:17:03 -0400
X-Gmail-Original-Message-ID: <CA+FuTScQ2WdEqQpsCdM_KZK9e+Zq7v5B+x=HLthxLAyOhYu-zQ@mail.gmail.com>
Message-ID: <CA+FuTScQ2WdEqQpsCdM_KZK9e+Zq7v5B+x=HLthxLAyOhYu-zQ@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 3/4] net: ethernet: ti: davinci_cpdma: return
 handler status
To:     Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc:     David Miller <davem@davemloft.net>, grygorii.strashko@ti.com,
        hawk@kernel.org, brouer@redhat.com, saeedm@mellanox.com,
        leon@kernel.org, Alexei Starovoitov <ast@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org,
        Network Development <netdev@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        jakub.kicinski@netronome.com,
        John Fastabend <john.fastabend@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 25, 2019 at 2:00 PM Ivan Khoronzhuk
<ivan.khoronzhuk@linaro.org> wrote:
>
> This change is needed to return flush status of rx handler for
> flushing redirected xdp frames after processing channel packets.
> Do it as separate patch for simplicity.
>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>

> @@ -602,7 +605,8 @@ static int cpsw_tx_mq_poll(struct napi_struct *napi_tx, int budget)
>                 else
>                         cur_budget = txv->budget;
>
> -               num_tx += cpdma_chan_process(txv->ch, cur_budget);
> +               cpdma_chan_process(txv->ch, &cur_budget);
> +               num_tx += cur_budget;

Less code change to add a new argument int *flush to communicate the
new state and leave the existing argument and return values as is?
