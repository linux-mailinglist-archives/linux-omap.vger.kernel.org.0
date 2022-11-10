Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A32624B7F
	for <lists+linux-omap@lfdr.de>; Thu, 10 Nov 2022 21:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbiKJUQb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Nov 2022 15:16:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbiKJUQb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Nov 2022 15:16:31 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83D5450BF
        for <linux-omap@vger.kernel.org>; Thu, 10 Nov 2022 12:16:28 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id p12so2472779plq.4
        for <linux-omap@vger.kernel.org>; Thu, 10 Nov 2022 12:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TElCG4eFIdf6STksjddJrggUNxP/AlOjbuXBcSw0mM=;
        b=sfzP9GkS2N8sV3ZFlaibrEoEWCHxFt3EUEMFqZbOnqQ8cnYcdfZ9ooaPucSaV9CcYt
         cEzu6kJyyn1csUNE8WY7Uqbk7bCr+BpjdH9bG5A9bgf9E8jI+3GSs5zyLT4whRZiMUIz
         JSnePOQn60uFry3wLpyfIcBN5dF7HodqQcTWKLTkpFZlSxHzHCZTjXI9qQEX+xQEVw8l
         N0BFXZdCdCT1a9N9u/UvWInBVNt54VW1JCtSmuqZ754zU5wksCz5D5Xr8krsAlIQny/d
         QuG8R5DaZuP2ZdfFJl5LAw+PuqbNGAOPN4B4SJofHM7UFzQDAsGSuJQcYcShSzcrEecG
         Jdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TElCG4eFIdf6STksjddJrggUNxP/AlOjbuXBcSw0mM=;
        b=0xY/72CWcAUKBV7cZK1LBUTn/drW7mV8bs4rNomf78Jxil9BxsJj0M9Y2tpLG7cWeO
         nQMkcJDFoG7ds7K+SubBbc3ycUbTglEBKy3YH1DzsTM5c4THqaMWrNCWZqbbI7rT9od5
         +pJHS6/cvtdEhiHHVJpcJo5gzoOzhNfW+4ylkojwRtZ6vkUYZ5WV+xdi/smrdSgaJmOm
         ePjIC+Em8I1u/0Cwz9bmODnWPWoOAeo8Ytv6sXqwqKBZ7zNunHZceU/w7XpBaGuT0ROT
         L+ejINp33JoQVN8PzGKapg4zTs+D8Qlq0XIKq2lRJtPzFwoIRcUpV+fNq4zrWv7SKCQs
         ULLQ==
X-Gm-Message-State: ACrzQf3Oir13M5lUhbfh/gYgEkYtf8IEBNmIMzX1QW18C0T3gsTyIs4x
        gWVFbWC6YdJekRZQLtWzi45o3w==
X-Google-Smtp-Source: AMsMyM668jd6+A/ewh9nZvDze5l7U6DAYz/tHcvu9BcXLhffErJqbrIv11eqIx4lwO+6RsL5KqCg1A==
X-Received: by 2002:a17:90a:68cd:b0:212:ca89:41c9 with SMTP id q13-20020a17090a68cd00b00212ca8941c9mr1913900pjj.244.1668111388236;
        Thu, 10 Nov 2022 12:16:28 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id z1-20020aa79901000000b005360da6b26bsm50380pff.159.2022.11.10.12.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 12:16:27 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Andrew Davis <afd@ti.com>, jerome Neanne <jneanne@baylibre.com>,
        Nishanth Menon <nm@ti.com>
Cc:     Lee Jones <lee@kernel.org>, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kristo@kernel.org,
        dmitry.torokhov@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, tony@atomide.com,
        vigneshr@ti.com, bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com,
        narmstrong@baylibre.com, msp@baylibre.com, j-keerthy@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v6 4/6] mfd: tps65219: Add driver for TI TPS65219 PMIC
In-Reply-To: <1231f3e6-61a7-ca3c-2fbb-679b583e0df1@ti.com>
References: <20221011140549.16761-1-jneanne@baylibre.com>
 <20221011140549.16761-5-jneanne@baylibre.com>
 <Y1+q2Usm9ecicXqp@google.com>
 <1383fd22-c720-811e-a2bb-be2151675089@baylibre.com>
 <20221105000104.rtj3r6ufqwqmepon@keenly> <7heduewjp0.fsf@baylibre.com>
 <5418ac3b-04d7-5e77-7612-c8f168e24621@ti.com>
 <1267bf43-618c-7347-be3a-2792c656d9b6@baylibre.com>
 <7hk042agn4.fsf@baylibre.com>
 <1231f3e6-61a7-ca3c-2fbb-679b583e0df1@ti.com>
Date:   Thu, 10 Nov 2022 12:16:27 -0800
Message-ID: <7hfseqa7l0.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Andrew Davis <afd@ti.com> writes:

> On 11/10/22 11:00 AM, Kevin Hilman wrote:
>> jerome Neanne <jneanne@baylibre.com> writes:
>>=20
>>> On 09/11/2022 22:59, Andrew Davis wrote:
>>>> On 11/7/22 3:14 PM, Kevin Hilman wrote:
>>>>> Nishanth Menon <nm@ti.com> writes:
>>>>>
>>>>>> On 13:58-20221104, jerome Neanne wrote:
>>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Can you try an compile with W=3D1 please.
>>>>>>> This raise one warning on mfd:
>>>>>>> drivers/mfd/tps65219.c:28:12: warning: =E2=80=98tps65219_soft_shutd=
own=E2=80=99
>>>>>>> defined but
>>>>>>> not used [-Wunused-function]
>>>>>>>  =C2=A0=C2=A0=C2=A0 28 | static int tps65219_soft_shutdown(struct t=
ps65219 *tps)
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~
>>>>>>> soft_shutdown has been validated and is used in TI baseline even if=
 not
>>>>>>> hooked in upstream version further to this review:
>>>>>>> https://lore.kernel.org/lkml/20220825150224.826258-5-msp@baylibre.c=
om/
>>>>>>>
>>>>>>> It was a TI requirement to implement it...
>>>>>>> Let me know if you want me to remove this function or if we can keep
>>>>>>> it like
>>>>>>> this.
>>>>>>
>>>>>> There are platforms without psci, correct? I think the comment was to
>>>>>> drop the force override with system-power-controller property,
>>>>>>
>>>>>> if (!pm_power_off) {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0tps65219_i2c_client =3D client;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0pm_power_off =3D &tps65219_pm_power_off;
>>>>>> }
>>>>>>
>>>>>> Could still be valid for such platforms, no? I do see that the
>>>>>> capability that the PMIC has - which is software shutdown is a valid
>>>>>> feature that we support in many different PMIC drivers. Is'nt the jo=
b of
>>>>>> the driver to introduce the functionality in a manner that is
>>>>>> appropriate to the OS framework?
>>>>>
>>>>> Yeah, I think Nishanth is right here.
>>>>>
>>>>> We should probably keep the `if (!pm_power_off)` part so the PMIC will
>>>>> be used if PSCI is not, but it also allows an easy way to test/use the
>>>>> PMIC
>>>>> shutdown functionality downstream if needed.
>>>>>
>>>>
>>>> Then should be using the sys-off handler API[0] so it doesn't block PS=
CI
>>>> which is also switching over[1].
>>>>
>>>> Andrew
>>>>
>>>> [0] https://lwn.net/Articles/894511/
>>>> [1] https://www.spinics.net/lists/arm-kernel/msg1024127.html
>>> Can we go for upstream with v7 without tps65219_soft_shutdown. Then if
>>> everyone agrees with Andrew proposal, I'll submit a separate patch which
>>> adds implementation of tps65219_soft_shutdown support through sys-off
>>> handler.
>>>
>>> So that we are not blocking upstream in case further
>>> discussions/alignment are required.
>>=20
>> Seems OK to me.  Nishanth?  Andrew?
>>=20
>> But I think you'll need to at least submit a v8 without the unused
>> code/dead code that Lee pointed out.
>>=20
>
> If you need the v8 anyway, then add support through sys-off in
> that spin, should only be a couple lines of change.

Oops, my mistake.  I see v7 already has the dead code removed.  I got
confused because this thread is on v6.

IMO, I think v7 should be merged v7 (mfd part is already ack'd by Lee)
and then Jerome will follow up with the support for sys-off as an
additional series.

Kevin
