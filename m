Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EC2767FBA
	for <lists+linux-omap@lfdr.de>; Sat, 29 Jul 2023 15:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbjG2NvT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 29 Jul 2023 09:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjG2NvS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 29 Jul 2023 09:51:18 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BE1199
        for <linux-omap@vger.kernel.org>; Sat, 29 Jul 2023 06:51:17 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4863f6ffed5so1141328e0c.0
        for <linux-omap@vger.kernel.org>; Sat, 29 Jul 2023 06:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690638676; x=1691243476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMNLUfpZqoDexDPllLPnk4uUqUNtiZ0vTNU2n1jKZX8=;
        b=fG5rmuqb4wscMQ6ZZRU/koMEGPRVOVF69vGWRmQTiAMB5I/OTHNgvN7CQnWfbZ6tWV
         hbloZHILAMKXvCS0jZMBfEC0+HOvby1jgtykDYQizM14X5IVvfqzr1Ri2PfE77guu7n9
         AQqSzskdRDFXmPJYooB5iNhHoSF6dRL2w/z/BaSH7ml4w/o4Lj54uAcq0Z2uvGKT3h7l
         wqR4KgkunZxWbYZW6UGVefaKq7Oa1oKzqw1oVpw0wSnT7VytfRb6sp1QGrbLubjdySDn
         WWsE6Qg356QGSogawab2F3lTSr4tMB0n3iIfFE0u30zK2hJP9lykPgTh1yDT1X7OZssm
         vlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690638676; x=1691243476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMNLUfpZqoDexDPllLPnk4uUqUNtiZ0vTNU2n1jKZX8=;
        b=JXXgkddviW8jDVe7MnlSetBIyOVcKv0bBmpJQKKVmbNn9pydOFDzPGsZK0mY5Gswwd
         1dgh4iduI3idfWkBrw82C1uoaM3VlrQ3wdyJIp6TBs5m3h5NU8jCRf7e+n7oXZXnQBPc
         GL/l3uI9wqCAjqOhKO+lFOyOnHHG1ho9z2CFSwKvZMfprQiKHVFfv2CxaBLXAShy4XUu
         YWqV1BFaBq2j2qM7yoSK/BtvnVaOJn0MkSx9ITqJfOUcxIAQqK8G8VKZ4YI7dvU0D8nU
         WW/ndzPr6fhhefiehPGkQnyoUV8JpFcUoZCuf9BuvtdywEcRZ1bh9ppxEYCue9FzUCjG
         udZQ==
X-Gm-Message-State: ABy/qLbrfZ109SfAB5GVR8CgR/ivAaDPW+7nOl+OShhDvOU2YQrFJVCh
        63KCPBKynp62YtEIhqFtTW7UM+Tnt7idjisrI64IOiaRz9ubqtnTesk=
X-Google-Smtp-Source: APBJJlFiKvyURAlxhHJrT2uslgauOKKxfrwaDb6shL8iDM+gSjpfh1DG6gEV1onr92MCAPpOepW/tqMIkMIQG4k1T58=
X-Received: by 2002:a05:6102:7cb:b0:440:de70:6c10 with SMTP id
 y11-20020a05610207cb00b00440de706c10mr3071236vsg.14.1690638676157; Sat, 29
 Jul 2023 06:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230727124043.2751747-1-ruanjinjie@huawei.com>
In-Reply-To: <20230727124043.2751747-1-ruanjinjie@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 Jul 2023 15:51:05 +0200
Message-ID: <CAMRc=MdYwzrK68+9eMq8_1unP=VR5Nv-bLoEJu1UARHHLkt2uw@mail.gmail.com>
Subject: Re: [PATCH -next v3] gpio: omap: Remove redundant dev_err_probe() and
 zero value handle code
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org,
        grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 27, 2023 at 2:41=E2=80=AFPM Ruan Jinjie <ruanjinjie@huawei.com>=
 wrote:
>
> There is no need to call the dev_err_probe() function directly to print
> a custom message when handling an error from platform_get_irq() function =
as
> it is going to display an appropriate error message in case of a failure.
>
> And the code to handle bank->irq =3D 0 is redundant because
> platform_get_irq() do not return 0.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---

Applied, thanks!

Bart
