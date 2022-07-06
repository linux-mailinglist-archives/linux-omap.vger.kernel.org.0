Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2643D568E11
	for <lists+linux-omap@lfdr.de>; Wed,  6 Jul 2022 17:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbiGFPtZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Jul 2022 11:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbiGFPtE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Jul 2022 11:49:04 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743592A702
        for <linux-omap@vger.kernel.org>; Wed,  6 Jul 2022 08:42:26 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-fe023ab520so21861492fac.10
        for <linux-omap@vger.kernel.org>; Wed, 06 Jul 2022 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=XQECPGbI7yYCA2ax5HRRu40BEupY02apRIdo/EARm0Mf+DmosQ7gl8wfAU5p484Bx8
         CCKTfawcDZdxkReE6Lq3Dr9wfNj94Q6V07LyjATFq9oibnG5ZSpQzF4rse+kQxEwI/12
         ZFsYJho0IotRk9TQ5Tq6dlML92hAW11MbhSYszs3wUYIsFIuWlZK15i7Y5Oq7ZBFwQOE
         KFFj5eMqL93uXDSpJgBlK0DlY9qYBOnbXtDM+VkOgvWDgidEPCAFdPtq90CksT0v5tyT
         z289V3ct0tYraR7VPRZg+Pl161tWLxRrst/VR6XHSqjkrqv1AwUQoBkuRU5zWSW/updI
         ZRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=RFF5niZHLWKgLaG4vUJbrfE2AJ3bURauaVwVSxDYOjImcr9My848TRE8n3Jh3eJ/ds
         SAeFV73mZch3c4wExTeFWuXVGgeFVGOZtoL+KxjgmE1j9yabmPi4TzEccC753w9XbiJI
         R/W67zS/ioHTm7myB3xxXUqV4fe1xUQwjxwnmPDg1o0tOZGVSNzuV3zjSLfdSFlBuvyc
         /AbUoavNFV6InwOFdHe79RryIJQXxX5Pr4+8/ngnXOzosmKgChi0dVzoT5rydIXyjxMs
         oY3CVlyjfDvo2VUvJQ3/iQAW0iOxP5eQ8MKwlf/J5y1hUkgzwT+cV4zcrtWZc2sCj1Jh
         CJvQ==
X-Gm-Message-State: AJIora/MMh1rmbB7r+jWhRlcxxqJkVyQ1lIyhiR+cvpHY74GrtfFsiLH
        YTroaLDljT/S4m/qs8lPssRecKEVYRa6od286fg=
X-Google-Smtp-Source: AGRyM1uWuqPnoZU+hQ39RA3y/RcWyfHl4/nTCo2cWsFxGQrQ99tK3xVdwQ4HyNHyc/CvLt7K9Hg+3al5mtc5p/FE53M=
X-Received: by 2002:a05:6870:7022:b0:10b:f0ea:d441 with SMTP id
 u34-20020a056870702200b0010bf0ead441mr11953904oae.39.1657122145912; Wed, 06
 Jul 2022 08:42:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4545:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 08:42:25 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <avrielharry73@gmail.com>
Date:   Wed, 6 Jul 2022 15:42:25 +0000
Message-ID: <CAFSKFDYHgAVrTG-+f+S5PbO07toSu3kpMMLkpSgGre=yJehYsQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

LS0gDQrQl9C00YDQsNCy0L4g0LTRgNCw0LPQsA0K0JLQtSDQvNC+0LvQsNC8LCDQtNCw0LvQuCDR
mNCwINC00L7QsdC40LLRgtC1INC80L7RmNCw0YLQsCDQv9GA0LXRgtGF0L7QtNC90LAg0L/QvtGA
0LDQutCwLCDQstC4INCx0LvQsNCz0L7QtNCw0YDQsNC8Lg0K
