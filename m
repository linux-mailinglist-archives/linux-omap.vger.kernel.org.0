Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC9985BBEFE
	for <lists+linux-omap@lfdr.de>; Sun, 18 Sep 2022 18:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiIRQuH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Sep 2022 12:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiIRQuE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 18 Sep 2022 12:50:04 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86682DEC2
        for <linux-omap@vger.kernel.org>; Sun, 18 Sep 2022 09:50:03 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-127dca21a7dso58844910fac.12
        for <linux-omap@vger.kernel.org>; Sun, 18 Sep 2022 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=/h9gKnMfrpB8UgQ8t9enyoIllg4YKOK1P8hel/POVkQ=;
        b=UNU2p/hrbCw2/NNR01sPe5VjaPu1RGePKoJzGi95DZCUZGzznhAjpmPCop2pZJlA8B
         ZhgoU3dsrKxjo5HGX13DHaCAoQQOA1MJukvnjbnsQHw8Ot0LL4LcRA5AVeayhPLOgrhE
         ehcTdd3Ft61UoCTW90srYmugpUGo3p2lgpttiXTCJgZBlUHAT+sXTicv+z+XYqW9Cx5P
         nQY9WgzcHd9Ek91UZ4d5tN3jK7BYQUmkP/NkZTj/JGvlkpfVET3TQ9hRCdfms/nTwOfK
         h5cwjIzKSyZSD1VnvV0TeEOdYa8vjo8ZAQPX2jH/swIGJHioDFm290AJftEqwjFpgJ5o
         011w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/h9gKnMfrpB8UgQ8t9enyoIllg4YKOK1P8hel/POVkQ=;
        b=RU3YMXaxzQxz8V9PZV9ZnQjEXoO33Q0C349zKYWRM6T5+j7HGy8WUy3GpYJnTiFIQx
         SkoP3Fqu3GOsIutqUiEiFG+WSWZwUWta1PxoMlPkZXRptqBe2kM6rBP9LuimmK+/qK+7
         AeQBZmNR3fzPau/xcrLW4YT36mAnwei8+GB8mB7kKlDKVygwbwip8DeNB3uojCTKPJws
         p5HVdPaXT5kdT9l0Bj9Uz5zYtifDnaqwGOk0edFVS4Syr5mDPeOukFKuwFxb+D/ckTtd
         n6mYhUy1N5rN/86Wc5zQOjAxtCOFECm1+FUUT442WAgqLkOgj3DzesDIH7jTgjjSflYv
         TDMQ==
X-Gm-Message-State: ACgBeo3CfLq5aQf6pJPRXLhB54CpDGXmuS7Vvfg4QbsfZfwFU16IdQ9f
        FstdKikbqq/eG7Cc708DrdmAZmf7y6wHkyV7eJQ=
X-Google-Smtp-Source: AA6agR6Lw0hX8lCNOPZRzDGyF08J01wUBW3MjkW0Ms580f0QwTJAw41b0/UEECmsGLG6/7opeIiFoGKisg+Kk/ZTItk=
X-Received: by 2002:a05:6870:168c:b0:127:c627:3bad with SMTP id
 j12-20020a056870168c00b00127c6273badmr13031812oae.93.1663519802492; Sun, 18
 Sep 2022 09:50:02 -0700 (PDT)
MIME-Version: 1.0
Sender: onosetaleelishevaunuebholo@gmail.com
Received: by 2002:a05:6850:7ad4:b0:32c:d8e3:2685 with HTTP; Sun, 18 Sep 2022
 09:50:01 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Sun, 18 Sep 2022 09:50:01 -0700
X-Google-Sender-Auth: x9Kde0_3TwV-UrYwNklAKbat7f4
Message-ID: <CACBkC06eJ1EdbYjR1FsVrrCZh-Vjr5wSdnE70sTsw16C3QGjFA@mail.gmail.com>
Subject: Hi Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Dear

My name is Dr Lisa Williams from the United States.I am a French and
American nationality dual) living in the U.S and sometimes in France
for Work Purpose. I hope you consider my friend request. I will share
some of my pics and more details about myself when I get your
response.

Thanks

With love
Lisa
